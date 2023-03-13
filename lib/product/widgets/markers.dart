import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:earthquake_emergency/product/widgets/keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../features/api_data/model.dart';
import '../../features/isolate_api_data/model.dart';
import 'package:flutter/material.dart';

Future<Marker> markerBuilder(Cluster<CalculatedClusterPlace> cluster) async {
  List<String?> reasonList = cluster.items
      .map(
        (e) => e.reason,
      )
      .toList();
  Set<String> reasons = {};
  Iterable<String> nullSafeReason = reasonList
      .where(
        (e) => e != null,
      )
      .map((e) => e as String)
      .map((e) => e.replaceAll(' ', ''));
  for (String joinedReason in nullSafeReason) {
    for (String literal in joinedReason.split(',')) {
      reasons.add(literal);
    }
  }

  List<String>? needs = cluster.items
      .where(
        (element) => element.needs != null && element.needs!.contains('label'),
      )
      .map(
        (e) => e.needs!,
      )
      .map((e) => e)
      .toList();
  RegExp exp = RegExp(r'label: (.+?),');
  Iterable<RegExpMatch> matches = exp.allMatches(needs.join(""));
  List<String> needList = [];
  for (final m in matches) {
    // print(m[1]);
    if (m[1] != null) {
      needList.add(m[1]!);
    }
  }
  String buildSnippet() {
    var snippet =
        'Bilgi Kanalı: ${{...cluster.items.map((e) => e.channel)}.join(", ")}';
    if (needList.length > 0) {
      snippet = 'Yardım: ${needList.join(", ")}' + '\n\n' + snippet;
    }
    return snippet;
  }

  // print('reasons for a marker are $reasons');
  return Marker(
    markerId: MarkerId(cluster.getId()),
    position: cluster.location,
    infoWindow: InfoWindow(
        title: 'Kategori: ${reasons.join(", ")}', snippet: buildSnippet()),
    onTap: () {
      // print('$needs');
      mapWidgetKey.currentState?.showSnack('Lokasyon',
          location: cluster.location,
          reasons: reasons,
          needs: needList,
          needList: needList);
      // print('---- $cluster');
      // cluster.items.forEach((p) => print('${p.channel} ${p.reason}'));
    },
    icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
        text: cluster.isMultiple ? cluster.count.toString() : null,
        tags: reasons,
        clusterCount: cluster.count),
  );
}

class MyImagePainter extends CustomPainter {
  final ui.Image myBackground;
  const MyImagePainter(this.myBackground);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(myBackground, Offset.zero, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

Future<ui.Image> _loadImage(String imageAssetPath, int size) async {
  final ByteData data = await rootBundle.load(imageAssetPath);
  final codec = await ui.instantiateImageCodec(
    data.buffer.asUint8List(),
    targetHeight: (size / 1.5).toInt(),
    targetWidth: (size * (45 / 56) / 1.5).toInt(),
  );
  var frame = await codec.getNextFrame();
  return frame.image;
}

Future<BitmapDescriptor> _getMarkerBitmap(int size,
    {String? text, Set<String>? tags, int? clusterCount}) async {
  if (kIsWeb) size = (size / 2).floor();

  final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint1 = Paint()..color = Colors.orange;
  final Paint paint2 = Paint()..color = Colors.white;
  canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
  canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
  canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);
  if (tags != null) {
    for (Tag tag in tags.map((e) => Tag.fromReason(e)!)) {
      canvas.drawCircle(
          Offset(size / 2, size / 2),
          size / ui.lerpDouble(2.2, 6, tag.index / Tag.values.length)!,
          Paint()
            ..color = tag.tagColor.withOpacity(.6)
            ..style = PaintingStyle.fill
            ..strokeWidth = 3);

      // canvas.
    }
  }
  if (clusterCount != null && clusterCount < 10 && tags != null) {
    try {
      final List<String> assetImages = tags
          .map((e) => Tag.fromReason(e))
          .where((element) => element?.assetImage != null)
          .map((e) => e!.assetImage!)
          .toList();
      if (assetImages.isNotEmpty) {
        final _singleImage = await _loadImage(assetImages[0], size);
        ui.Image? _secondImage;
        if (clusterCount > 5) {
          if (assetImages.length > 1) {
            _secondImage = await _loadImage(assetImages[1], size);
          }
          final _doublePainter = Paint()
            ..blendMode = BlendMode.darken
            // ..imageFilter = ui.ImageFilter.blur(sigmaX: 1, sigmaY: 1)
            ..color = Color.fromRGBO(0, 0, 0, .5);
          canvas.drawImage(_singleImage, Offset(0, size / 4), _doublePainter);
          canvas.drawImage(_secondImage ?? _singleImage,
              Offset(size / 2.2, size / 4), _doublePainter);
        } else if (clusterCount < 5) {
          final _singlePainter = Paint()
            ..blendMode = BlendMode.darken
            // ..imageFilter = ui.ImageFilter.blur(sigmaX: 1, sigmaY: 1)
            ..color = Color.fromRGBO(0, 0, 0, .8);
          canvas.drawImage(
              _singleImage, Offset(size / 4.2, size / 4), _singlePainter);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  if (text != null) {
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: text,
      style: TextStyle(
          fontSize: size / 3,
          color: Colors.white,
          fontWeight: FontWeight.normal),
    );
    painter.layout();
    painter.paint(
      canvas,
      Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
    );
  }
  // if (info != null) {
  //   TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
  //   painter.text = TextSpan(
  //     text: info,
  //     style: TextStyle(
  //         // fontSize: size / (8 + ((info.length) / 5).floor()),
  //         fontSize: size / (8),
  //         color: Colors.blue.withOpacity(.7),
  //         overflow: TextOverflow.fade,
  //         fontWeight: FontWeight.w300),
  //   );
  //   painter.layout();
  //   painter.paint(
  //     canvas,
  //     Offset(size / 2 - painter.width / 2, (size / 4 - painter.height / 4)),
  //   );
  // }

  final img = await pictureRecorder.endRecording().toImage(size, size);
  final data = await img.toByteData(format: ui.ImageByteFormat.png) as ByteData;

  return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
}
