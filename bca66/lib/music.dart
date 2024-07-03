import 'package:flutter/material.dart';


import 'package:mr_music/screens/home_Screens.dart';
import 'package:mr_music/screens/My_PlayList.dart';
import 'package:mr_music/screens/MyFav.dart';
import 'package:mr_music/screens/connect.dart';

import 'package:mr_music/widgets/appBar.dart';
class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
//List <Integer> num = new ArrayList <>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  static List<Widget> widgetOptions =[
    HomeScreens(),
    MyPlaylist(),
    MyFav(),
    Connect()
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CoustomAppBar(
        title: 'mr_Music',
        scaffoldKey: scaffoldKey,
        onNotificationTap: (){},
        onLoginTap: () => showLoginBottomSheet(context),
      ),

      drawer: SideBar(),



      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}

