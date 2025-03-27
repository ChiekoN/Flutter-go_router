import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:universal_platform/universal_platform.dart';

import 'src/shared/app.dart';

Future setDesktopWindow() async {
  await DesktopWindow.setWindowSize(const Size(412, 983));
}

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Initializing Flutter binding (might not necessary but I put for best practice)

  if (UniversalPlatform.isDesktop) {
    setDesktopWindow();
  }
  
  runApp(const MyApp());
}

