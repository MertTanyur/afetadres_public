import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import '../../features/isolate_api_data/model.dart';
import '../../features/isolate_api_data/model2.dart';

class MapDataWorker {
  MapDataWorker._(this._isolate);
  Isar? isar;
  final Isolate _isolate;
  // final String _path;
  late final SendPort _sendPort;
  // Completers are stored in a queue so multiple commands can be queued up and
  // handled serially.
  final Queue<Completer<void>> _completers = Queue<Completer<void>>();
  // Similarly, StreamControllers are stored in a queue so they can be handled
  // asynchronously and serially.
  final Queue<StreamController<String>> _resultsStream =
      Queue<StreamController<String>>();

  /// Open the database at [path] and launch the server on a background isolate..
  static Future<MapDataWorker> open() async {
    print('spawning isolate!!!');
    final ReceivePort receivePort = ReceivePort();
    final Isolate isolate =
        await Isolate.spawn(_SimpleDatabaseServer._run, receivePort.sendPort);
    final MapDataWorker result = MapDataWorker._(isolate);
    Completer<void> completer = Completer<void>();
    result._completers.addFirst(completer);
    receivePort.listen((Object? message) {
      if (message is _Command) {
        result._handleCommand(message as _Command);
      }
      // print('a message received! message is -> $message');
    });
    await completer.future;

    print('completeddd');
    return result;
  }

  /// Writes [value] to the database.
  Future<void> addEntry(String value) {
    // No processing happens on the calling isolate, it gets delegated to the
    // background isolate, see [__SimpleDatabaseServer._doAddEntry].
    print('adding entry');
    Completer<void> completer = Completer<void>();
    _completers.addFirst(completer);
    _sendPort.send(_Command(_Codes.add, arg0: value));
    return completer.future;
  }

  Future<void> fetch(String reason) async {
    print('adding entry');
    Completer<void> completer = Completer<void>();
    _completers.addFirst(completer);
    _sendPort.send(_Command(_Codes.query, arg0: reason));
    return completer.future;

    // No processing happens on the calling isolate, it gets delegated to the
    // background isolate, see [__SimpleDatabaseServer._doAddEntry].
  }

  /// Returns all the strings in the database that contain [query].
  // Stream<String> find(String query) {
  //   // No processing happens on the calling isolate, it gets delegated to the
  //   // background isolate, see [__SimpleDatabaseServer._doFind].
  //   StreamController<String> resultsStream = StreamController<String>();
  //   _resultsStream.addFirst(resultsStream);
  //   _sendPort.send(_Command(_Codes.query, arg0: query));
  //   return resultsStream.stream;
  // }

  /// Handler invoked when a message is received from the port communicating
  /// with the database server.
  void _handleCommand(_Command command) {
    switch (command.code) {
      case _Codes.init:
        _sendPort = command.arg0 as SendPort;
        // ----------------------------------------------------------------------
        // Before using platform channels and plugins from background isolates we
        // need to register it with its root isolate. This is achieved by
        // acquiring a [RootIsolateToken] which the background isolate uses to
        // invoke [BackgroundIsolateBinaryMessenger.ensureInitialized].
        // ----------------------------------------------------------------------
        RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
        _sendPort.send(_Command(_Codes.init, arg0: rootIsolateToken));
        break;
      case _Codes.ack:
        _completers.removeLast().complete();
        break;
      case _Codes.result:
        // _resultsStream.last.add(command.arg0 as String);

        print('switch case result reason is -> ${command.arg0}');
        break;

      case _Codes.done:
        _resultsStream.removeLast().close();
        break;
      default:
        print('SimpleDatabase unrecognized command: ${command.code}');
    }
  }
  // void _handleCommand(_Command command) {
  //   switch (command.code) {
  //     case _Codes.init:
  //       _sendPort = command.arg0 as SendPort;
  //       // ----------------------------------------------------------------------
  //       // Before using platform channels and plugins from background isolates we
  //       // need to register it with its root isolate. This is achieved by
  //       // acquiring a [RootIsolateToken] which the background isolate uses to
  //       // invoke [BackgroundIsolateBinaryMessenger.ensureInitialized].
  //       // ----------------------------------------------------------------------
  //       RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
  //       _sendPort
  //           .send(_Command(_Codes.init, arg0: _path, arg1: rootIsolateToken));
  //       break;
  //     case _Codes.ack:
  //       _completers.removeLast().complete();
  //       break;
  //     case _Codes.result:
  //       _resultsStream.last.add(command.arg0 as String);
  //       break;
  //     case _Codes.done:
  //       _resultsStream.removeLast().close();
  //       break;
  //     default:
  //       print('SimpleDatabase unrecognized command: ${command.code}');
  //   }
  // }

  /// Kills the background isolate and its database server.
  void stop() {
    _isolate.kill();
  }
}

/// The portion of the [SimpleDatabase] that runs on the background isolate.
///
/// This is where we use the new feature Background Isolate Channels, which
/// allows us to use plugins from background isolates.
class _SimpleDatabaseServer {
  _SimpleDatabaseServer(this._sendPort);

  final SendPort _sendPort;
  // late final String _path;
  // late final SharedPreferences _sharedPreferences;

  // ----------------------------------------------------------------------
  // Here the plugin is used from the background isolate.
  // ----------------------------------------------------------------------
  bool get _isDebug => true;
  //_sharedPreferences.getBool('isDebug') ?? false;

  /// The main entrypoint for the background isolate sent to [Isolate.spawn].
  static void _run(SendPort sendPort) {
    ReceivePort receivePort = ReceivePort();
    sendPort.send(_Command(_Codes.init, arg0: receivePort.sendPort));
    final _SimpleDatabaseServer server = _SimpleDatabaseServer(sendPort);
    receivePort.listen((Object? message) async {
      final _Command command = message as _Command;
      server._handleCommand(command);
    });
  }

  /// Handle the [command] received from the [ReceivePort].
  Future<void> _handleCommand(_Command command) async {
    switch (command.code) {
      case _Codes.init:
        // _path = command.arg0 as String;
        // ----------------------------------------------------------------------
        // The [RootIsolateToken] is required for
        // [BackgroundIsolateBinaryMessenger.ensureInitialized] and must be
        // obtained on the root isolate and passed into the background isolate via
        // a [SendPort].
        // ----------------------------------------------------------------------
        RootIsolateToken rootIsolateToken = command.arg0 as RootIsolateToken;
        // ----------------------------------------------------------------------
        // [BackgroundIsolateBinaryMessenger.ensureInitialized] for each
        // background isolate that will use plugins. This sets up the
        // [BinaryMessenger] that the Platform Channels will communicate with on
        // the background isolate.
        // ----------------------------------------------------------------------
        BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
        // _sharedPreferences = await SharedPreferences.getInstance();
        _sendPort.send(const _Command(_Codes.ack, arg0: null));
        break;
      case _Codes.add:
        print('add command received');
        // _sendPort.send(_Command());

        // _doAddEntry(command.arg0 as String);
        break;
      case _Codes.query:
        print('result command received');
        // _sendPort.send(_Command());
        _fetchAndSave(command.arg0 as String);
        // _doAddEntry(command.arg0 as String);
        break;
      case _Codes.result:
        // _doFind(command.arg0 as String);
        break;
      default:
        print('_SimpleDatabaseServer unrecognized command ${command.code}');
    }
  }

  void _fetchAndSave(String reason) {
    print('performing fetch and save in isolate, for $reason');

    fetch_reason(reason);
    _sendPort.send(const _Command(_Codes.result, arg0: 'abidin fetched'));
  }

  /// Perform the add entry operation.
  // void _doAddEntry(String value) {
  //   if (_isDebug) {
  //     print('Performing add: $value');
  //   }
  //   // File file = File(_path);
  //   // if (!file.existsSync()) {
  //   //   file.createSync();
  //   // }
  //   // RandomAccessFile writer = file.openSync(mode: FileMode.append);
  //   List<int> bytes = utf8.encode(value);
  //   if (bytes.length > _entrySize) {
  //     bytes = bytes.sublist(0, _entrySize);
  //   } else if (bytes.length < _entrySize) {
  //     List<int> newBytes = List.filled(_entrySize, 0);
  //     for (int i = 0; i < bytes.length; ++i) {
  //       newBytes[i] = bytes[i];
  //     }
  //     bytes = newBytes;
  //   }
  //   writer.writeFromSync(bytes);
  //   writer.closeSync();
  //   _sendPort.send(const _Command(_Codes.ack, arg0: null));
  // }

  /// Perform the find entry operation.
  // void _doFind(String query) {
  //   if (_isDebug) {
  //     print('Performing find: $query');
  //   }
  //   File file = File(_path);
  //   if (file.existsSync()) {
  //     RandomAccessFile reader = file.openSync();
  //     List<int> buffer = List.filled(_entrySize, 0);
  //     while (reader.readIntoSync(buffer) == _entrySize) {
  //       List<int> foo = buffer.takeWhile((value) => value != 0).toList();
  //       String string = utf8.decode(foo);
  //       if (string.contains(query)) {
  //         _sendPort.send(_Command(_Codes.result, arg0: string));
  //       }
  //     }
  //     reader.closeSync();
  //   }
  //   _sendPort.send(const _Command(_Codes.done, arg0: null));
  // }
}

const int _entrySize = 256;

/// All the command codes that can be sent and received between [SimpleDatabase] and
/// [_SimpleDatabaseServer].
enum _Codes {
  init,
  add,
  query,
  ack,
  result,
  done,
}

/// A command sent between [SimpleDatabase] and [_SimpleDatabaseServer].
class _Command {
  const _Command(this.code, {this.arg0, this.arg1});

  final _Codes code;
  final Object? arg0;
  final Object? arg1;
}

Dio dio = Dio(BaseOptions(
  baseUrl: 'https://apigo.afetharita.com/feeds/areas',
  connectTimeout: Duration(seconds: 5),
  queryParameters: {
    'ne_lat': '40.18726672309203',
    'ne_lng': '38.67187500000001',
    'sv_lat': '34.32529192442733',
    'sv_lng': '31.311035156250004',
    'time_stamp': 'undefined',
  },
));

Future<void> fetch_reason([String reason = 'genel']) async {
  try {
    print('fetching in 306');
    final toFetch = await compute(needToFetch, reason);
    if (true) {
      print('fetching $reason');
      if (reason != 'genel') {
        dio.options.queryParameters['reason'] = reason;
      }
      print('34');
      print('reason is ${dio.options.queryParameters}');
      Response result = await dio.get('/');
      // print('result status is -> ${result}');
      var a = TopLevelResponse.fromJson(result.data);
      print(a);
      var a1 = TopLevelResponse2.fromJson(result.data);
      print('a1 a2 is not null!!!!!!!!');
      final fetched_data = a.results?.toList();
      // final fetched_data2 = a1.results?.toList();
      if (fetched_data != null) {
        final isarMapDatas = fetched_data
            .map(
              (e) => ClusterPlace(mapDataModel: e, isClosed: false),
            )
            .map((e) => IsarMapData()
              ..loc = e.mapDataModel?.loc
              ..channel = e.mapDataModel?.channel
              ..needs = e.mapDataModel?.needs.toString()
              ..geoHash = e.geohash
              ..clusterPlace = e
              ..name = e.mapDataModel?.reason ?? 'genel')
            .toList();
        print('cluster places ->,${isarMapDatas.map((e) => e.name)}');
        print('total count is -> ${isarMapDatas.length}\n');
        await compute(saveToIsar, isarMapDatas);
        await compute(saveSnapshot, reason);
      }
      if (false) {
        // print('data is not null!!!!!!!!!!!!');
        // final isarMapData2s = fetched_data2
        //     .map(
        //       (e) => ClusterPlace2(mapDataModel: e, isClosed: false),
        //     )
        //     .map((e) => IsarMapData2()
        //       ..clusterPlace = e
        //       ..name = e.mapDataModel?.reason ?? 'genel')
        //     .toList();
        // // print('cluster places ->,${isarMapDatas.map((e) => e.name)}');
        // print('cluster places ->,${isarMapData2s.map((e) => e.name)}');
        // print('total count is -> ${isarMapData2s.length}\n');
        // await compute(saveToIsar2, isarMapData2s);
        // // await compute(saveSnapshot, reason);
      }
    }
  } catch (e) {
    print(e);
  }
  // for (var i in a.results!.toList()) {
  //   addMapData(i);
  // }
}

Future<void> saveToIsar(List<IsarMapData> items) async {
  print('saving to isar');
  // we don't need the path here because the instance is already opend
  final isar = await Isar.open(
    [IsarMapDataSchema, LastFetchedSchema, IsarMapData2Schema],
    // name: 'myInstance',
  );

  // final messages = List.generate(count, (i) => Message()..content = 'Message $i');
  // we use a synchronous transactions in isolates
  isar.writeTxnSync(() {
    isar.isarMapDatas.clearSync();
    print(
        'deleted and ${isar.isarMapDatas.count().then((value) => print('deleted $value'))}');
    isar.isarMapDatas.putAllSync(items);
  });
}

Future<bool> needToFetch(String reason) async {
  var result = false;
  final isar = await Isar.open(
    [IsarMapDataSchema, LastFetchedSchema, IsarMapData2Schema],
    // name: 'myInstance',
  );
  if (isar != null) {
    final collection = isar.lastFetcheds;
    final lastFetchedReason =
        await collection.filter().nameEqualTo(reason).findAll();
    if (lastFetchedReason.isEmpty) {
      return true;
    }
  }
  return result;
}

Future<void> saveSnapshot(String reason) async {
  final isar = await Isar.open(
    [IsarMapDataSchema, LastFetchedSchema, IsarMapData2Schema],
    // name: 'myInstance',
  );
  final snap = LastFetched()
    ..name = reason
    ..snapshot = DateTime.now();
  isar.writeTxnSync(() {
    isar.lastFetcheds.putSync(snap);
  });
}

Future<void> saveToIsar2(List<IsarMapData2> items) async {
  print('saving to isar');
  // we don't need the path here because the instance is already open
  final isar = await Isar.open(
    [IsarMapDataSchema, LastFetchedSchema, IsarMapData2Schema],
    // name: 'myInstance',
  );

  // final messages = List.generate(count, (i) => Message()..content = 'Message $i');
  // we use a synchronous transactions in isolates
  isar.writeTxnSync(() {
    isar.isarMapData2s.putAllSync(items);
  });
}

Future<bool> needToFetch2(String reason) async {
  var result = false;
  final isar = await Isar.open(
    [IsarMapDataSchema, LastFetchedSchema, IsarMapData2Schema],
    // name: 'myInstance',
  );
  if (isar != null) {
    final collection = isar.lastFetcheds;
    final lastFetchedReason =
        await collection.filter().nameEqualTo(reason).findAll();
    if (lastFetchedReason.isEmpty) {
      return true;
    }
  }
  return result;
}

Future<void> saveSnapshot2(String reason) async {
  final isar = await Isar.open(
    [IsarMapDataSchema, LastFetchedSchema, IsarMapData2Schema],
    // name: 'myInstance',
  );
  final snap = LastFetched()
    ..name = reason
    ..snapshot = DateTime.now();
  isar.writeTxnSync(() {
    isar.lastFetcheds.putSync(snap);
  });
}
