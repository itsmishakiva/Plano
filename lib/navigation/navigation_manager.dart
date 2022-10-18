import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plano/features/tasks_list/view/tasks_list_page.dart';

Provider<NavigationManager> navigationProvider = Provider(
  (ref) => NavigationManager(),
);

//Here we describe navigation functions, in order not to add logic in UI layer
class NavigationManager {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  //Navigate to task lists after auth, removeUntil makes impossible to go
  //to previous screen
  void navigateFromAuth() {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => TasksListPage(),
      ),
      (route) => false,
    );
  }

  //Closes current screen/dialog
  void pop([Object? result]) {
    navigatorKey.currentState?.pop(result);
  }
}
