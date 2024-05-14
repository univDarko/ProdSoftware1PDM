import 'package:flutter/material.dart';
import 'package:prod_software_rutinator/pantallas/login_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const LoginScreen());
  FlutterNativeSplash.remove();
}




