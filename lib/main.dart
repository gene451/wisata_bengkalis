import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wisata_bengkalis/screens/login_screen.dart';
import 'package:wisata_bengkalis/screens/main_screen.dart';
import 'package:wisata_bengkalis/screens/splash_screen.dart'; // ⬅️ TAMBAHAN
import 'screens/travel_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Ukuran standar desain mobile
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: const SplashScreen(), // ⬅️ DIUBAH KE SPLASH
        );
      },
    );
  }
}