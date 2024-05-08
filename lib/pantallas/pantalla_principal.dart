import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prod_software_rutinator/pantallas/pantalla1.dart';
import 'package:prod_software_rutinator/pantallas/pantalla2.dart';
import 'package:prod_software_rutinator/pantallas/pantalla3.dart';

class PantallaPrincipal extends StatelessWidget{

  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rutinator',
      theme: ThemeData(
        fontFamily: 'Custom',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const MiHomePage(title: 'Flutter Demo Home Page'),
      
    );
  }
  
}

class MiHomePage extends StatefulWidget {
  const MiHomePage({super.key, required this.title});

  final String title;

  @override
  State<MiHomePage> createState() => MainPantalla();
}

class MainPantalla extends State<MiHomePage> {

  int _currentIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  final _navItems = [
    const NavigationDestination(icon: Icon(Icons.star, color: Colors.blue,), label: "Uno"),
    const NavigationDestination(icon: Icon(Icons.star, color: Colors.green,), label: "Dos"),
    const NavigationDestination(icon: Icon(Icons.star, color: Colors.red,), label: "Tres"),
  ];

/*
  final _navItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.star, color: Colors.blue,), label: "Uno"),
    const BottomNavigationBarItem(icon: Icon(Icons.star, color: Colors.green,), label: "Dos"),
    const BottomNavigationBarItem(icon: Icon(Icons.star, color: Colors.red,), label: "Tres"),
  ];
*/


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text("Rutinator"),
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