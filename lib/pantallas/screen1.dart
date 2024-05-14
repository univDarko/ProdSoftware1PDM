import 'package:flutter/material.dart';

class Pantalla1 extends StatelessWidget{
  const Pantalla1({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/brawlAssets/bgscreenbrawl.png"), fit: BoxFit.cover),
      ),
    );
  }
}