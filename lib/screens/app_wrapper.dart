import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:simpleset_app/screens/analytics_screen.dart';
import 'package:simpleset_app/screens/home_screen.dart';
import 'package:simpleset_app/screens/profile_screen.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  int screenIndex = 0;

  final screens = [HomeScreen(), AnalyticsScreen(), ProfileScreen()];

  final appBars = const [
    Text('S I M P L E S E T'),
    Text('A N A L Y T I C S'),
    Text('P R O F I L E')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBars[screenIndex],
        backgroundColor: Colors.transparent,
      ),
      body: IndexedStack(
        index: screenIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: GNav(gap: 8, backgroundColor: Colors.black, tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
            onPressed: () {
              setState(() {
                screenIndex = 0;
              });
            },
          ),
          GButton(
            icon: Icons.auto_graph_rounded,
            text: 'Analytics',
            onPressed: () {
              setState(() {
                screenIndex = 1;
              });
            },
          ),
          GButton(
              icon: Icons.person,
              text: 'Profile',
              onPressed: () => {
                    setState(() {
                      screenIndex = 2;
                    }),
                  }),
        ]),
      ),
    );
  }
}
