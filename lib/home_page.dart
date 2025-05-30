import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/message_page.dart';
import 'package:social_media_app/profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.changeTheme});

  final void Function(bool useLightMode) changeTheme;

  @override
  State<Home> createState() => HomePage();
}

class HomePage extends State<Home> {
  bool hasNotifications = false;
  int tab = 0;
  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(CupertinoIcons.chat_bubble_2, color: Colors.white),
      label: 'Chat',
      selectedIcon: Icon(
        CupertinoIcons.chat_bubble_2_fill,
        color: Colors.white,
      ),
    ),
    NavigationDestination(
      icon: Icon(CupertinoIcons.group, color: Colors.white),
      label: 'Create Group',
      selectedIcon: Icon(CupertinoIcons.group_solid, color: Colors.white),
    ),
    NavigationDestination(
      icon: Icon(CupertinoIcons.person, color: Colors.white),
      label: 'Account',
      selectedIcon: Icon(CupertinoIcons.person_fill, color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      // 1
      Center(
        // 2
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: double. infinity),
          // 3
          child: MessagesScreen(),
        ),
      ),
      // 1
      Center(
        //2
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: double. infinity),
          // 3
          child: ProfilePage(),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Media X",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF3b9678),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.add, color: Colors.black, size: 30),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.bell, color: Colors.black, size: 30),
            onPressed: () {},
          ),
          if (hasNotifications)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF3b9678),
                ),
              ),
            ),
        ],
      ),
      body: IndexedStack(
        index: tab,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        // 2
        selectedIndex: tab,
        // 3
        onDestinationSelected: (index) {
          setState(() {
            tab = index;
          });
        },
        // 4
        destinations: appBarDestinations,
        backgroundColor: Color(0xFF3b9678),
        indicatorColor: Color(0xFF2a6b56),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
