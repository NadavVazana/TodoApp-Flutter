import 'package:flutter/material.dart';

void navigateToPage(BuildContext context, String pathName) {
  Navigator.pushNamed(context, pathName);
}

String getCurrentRoute(BuildContext context) {
  final currentRoute = ModalRoute.of(context)?.settings;
  return currentRoute?.name ?? '/';
}

void clearNavigatorTree(BuildContext context) {
  Navigator.of(context).pushNamedAndRemoveUntil('/', (Route route) => false);
}
