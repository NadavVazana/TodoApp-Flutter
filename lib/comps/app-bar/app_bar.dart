import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/navigation_service.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = getCurrentRoute(context);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.orangeAccent,
      flexibleSpace: FractionallySizedBox(
        heightFactor: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.edit_document),
              onPressed: () {
                if (currentRoute != '/') {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (Route route) => false);
                }
              },
            ),
            const Text(
              'TODO Application',
              style: TextStyle(fontSize: 21),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
