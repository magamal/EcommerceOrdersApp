import 'package:data/data.dart';
import 'package:di/di.dart' as di;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'the_orders_json_file_will_return.mocks.dart';

/// Usage: the orders json file is corrupted
@GenerateNiceMocks([MockSpec<AssetManager>()])
Future<void> theOrdersJsonFileIsCorrupted(WidgetTester tester) async {
  final assetManager = MockAssetManager();
  await di.getIt.unregister<AssetManager>();
  di.getIt.registerFactory<AssetManager>(() => assetManager);

  when(assetManager.loadString(any))
      .thenThrow((_) async => Exception("test exception"));
}
