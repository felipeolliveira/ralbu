import 'package:flutter/material.dart';

import 'app/core/service_locator.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator.init();

  runApp(const RalbuApp());
}
