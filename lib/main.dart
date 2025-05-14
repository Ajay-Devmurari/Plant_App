import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/provider/favorite_provider.dart';
import 'package:plant_app/provider/cart_provider.dart';
import 'package:plant_app/screen/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  Supabase.initialize(
    url: 'https://eagebmrmkbjlntwnngbw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVhZ2VibXJta2JqbG50d25uZ2J3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU1NTkzMDQsImV4cCI6MjA2MTEzNTMwNH0.H9_Q8F1gJkVy2Nd4K1Fd4LnQTGu_B3IWIfbupRT0xk8',
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ],
      child: DevicePreview(builder: (context) => const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFFF6F9F4),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        scaffoldBackgroundColor: Color(0xFFF6F9F4),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: OnboardingScreen(),
    );
  }
}
