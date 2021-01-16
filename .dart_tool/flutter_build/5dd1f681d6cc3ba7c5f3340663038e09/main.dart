// @dart=2.7

import 'dart:ui' as ui;

import 'package:rail_mock/main.dart' as entrypoint;

Future<void> main() async {
  await ui.webOnlyInitializePlatform();
  entrypoint.main();
}
