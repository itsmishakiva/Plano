import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/auth/view/auth_page.dart';
import 'package:plano/navigation/navigation_manager.dart';
import 'package:plano/themes/plano_themes.dart';

void main() async {
  //This line is needed for app to run after all
  //async functions awaited without exceptions
  WidgetsFlutterBinding.ensureInitialized();
  //Setting minimal screen size
  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    await DesktopWindow.setMinWindowSize(const Size(810, 550));
  }
  //Starting the app UI drawing, ProviderScope
  //is needed for riverpod state-management
  runApp(const ProviderScope(child: Application()));
}

//Widget that is parent for every other widget
//Entering all configs like themes, navigation, etc. here
class Application extends ConsumerWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: ref.read(navigationProvider).navigatorKey,
      theme: PlanoThemes.darkThemeData,
      home: const AuthPage(),
    );
  }
}
