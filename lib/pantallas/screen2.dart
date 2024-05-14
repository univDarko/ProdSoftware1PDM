import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget{
  const Pantalla2({super.key});
  
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/CCAssets/bgscreencc.jpg"), fit: BoxFit.cover),
      ),
    );
  }
}