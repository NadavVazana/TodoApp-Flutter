import 'package:flutter/material.dart';
import 'package:flutter_application_1/comps/app-bar/app_bar.dart';
import 'package:flutter_application_1/services/navigation_service.dart';

class TodoScaffold extends StatefulWidget {
  final Widget? body;
  TodoScaffold({super.key, this.body});

  final List<BottomNavigationBarItem> bottomBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          size: 30,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.info_outline_rounded,
          size: 30,
        ),
        label: 'About me')
  ];

  @override
  State<TodoScaffold> createState() => _TodoScaffoldState();
}

class _TodoScaffoldState extends State<TodoScaffold> {
  String currentRoute = '';
  int bottomBarSelectedIndex = 0;
  final Map<int, String> routesIndex = {0: '/', 1: '/about'};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        currentRoute = getCurrentRoute(context);
        bottomBarSelectedIndex = setSelectedIndex();
      });
    });
  }

  int setSelectedIndex() {
    for (var entry in routesIndex.entries) {
      if (currentRoute == entry.value) {
        return entry.key;
      }
    }
    return 0;
  }

  void onSelectBottomItem(int index) {
    setState(() {
      bottomBarSelectedIndex = index;
      final String? routePath = routesIndex[index];
      if (routePath != null) {
        if (routePath == '/') {
          clearNavigatorTree(context);
        } else {
          navigateToPage(context, routePath);
        }
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodoAppBar(),
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomBarSelectedIndex,
        onTap: onSelectBottomItem,
        unselectedFontSize: 14,
        selectedItemColor: Colors.orangeAccent,
        items: widget.bottomBarItems,
      ),
    );
  }
}
