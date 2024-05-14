import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget{
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/CRAssets/bgscreencr.png"), fit: BoxFit.cover),
      ),
    );
  }
}