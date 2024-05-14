import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prod_software_rutinator/pantallas/screen1.dart';
import 'package:prod_software_rutinator/pantallas/screen2.dart';
import 'package:prod_software_rutinator/pantallas/screen3.dart';
import 'package:prod_software_rutinator/data/userdatabase.dart';
import 'package:prod_software_rutinator/data/user.dart';

class MainScreen extends StatelessWidget{

  const MainScreen({super.key, required this.userdb});

  final Userdatabase userdb;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rutinator',
      theme: ThemeData(
        fontFamily: 'Custom',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: MyHomePage(userdb: userdb,),
      
    );
  }
  
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.userdb});
  final Userdatabase userdb;

  @override
  // ignore: no_logic_in_create_state
  State<MyHomePage> createState() => MyMainScreen(userdb: userdb);
}

class MyMainScreen extends State<MyHomePage> {
  MyMainScreen({required this.userdb});

  final Userdatabase userdb;
  int _currentIndex = 0;
  

  PageController _pageController = PageController(initialPage: 0);

  String getCurrentName(){
    return userdb.currentUser!.username!;
  }

  final _navItems = [
    NavigationDestination(icon: Image.asset('assets/brawlAssets/brawlicon.png', width: 30, height: 30,), label: "Brawl Stars"),
    NavigationDestination(icon: ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset('assets/CCAssets/clashclansicon.png', width: 30, height: 30,)
      ), 
      label: "Clash of Clans"),
    NavigationDestination(icon: ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset('assets/CRAssets/clashroyaleicon.png', width: 30, height: 30,)
      ), 
      label: "Clash Royale"),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Hola, ${getCurrentName()}",
          selectionColor: _currentIndex == 0 ? Colors.black : Colors.white),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (newIndex){
            setState(() {
              _currentIndex = newIndex;
            });
          },
          children: const [
            Pantalla1(),
            Pantalla2(),
            Pantalla3()
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          destinations: _navItems,
          onDestinationSelected: (newIndex){
            _pageController.animateToPage(
              newIndex, 
              duration: const Duration(milliseconds: 500), 
              curve: Curves.ease);
          },
          surfaceTintColor: Colors.blue,
          indicatorColor: Colors.amber,
          shadowColor: Colors.amberAccent,
        ),
      ),
    );
  }
}

/*

landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          type: BottomNavigationBarType.shifting,
          currentIndex: _currentIndex,
          items: _navItems,
          onTap: (newIndex){
            _pageController.animateToPage(
              newIndex, 
              duration: const Duration(milliseconds: 500), 
              curve: Curves.ease);
          },

*/