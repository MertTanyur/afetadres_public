import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import '../features/isolate_api_data/model.dart';
import '../features/isolate_api_data/model2.dart';

void main() {
  test('testing isar', () async {
    await Isar.initializeIsarCore(download: true);
    final isar = await Isar.open(
        [IsarMapDataSchema, LastFetchedSchema, IsarMapData2Schema]);
    print('${isar.isOpen}');
    print('${await isar.isarMapDatas.count()}');
  });
}
