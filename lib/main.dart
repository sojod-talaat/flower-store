import 'package:firebase_core/firebase_core.dart';
import 'package:flowerstore/app_router.dart';

import 'package:flowerstore/firebase_options.dart';
import 'package:flowerstore/providers/provider.dart';
import 'package:flowerstore/view/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    //ChangeNotifierProvider(create: (context) => CartModel()),
    ChangeNotifierProvider(create: (context) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => FireStoreProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: AppRouter.navKey,
        title: 'Awesome Clothes Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark),
                titleTextStyle: GoogleFonts.tajawal(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 22)),
            textTheme: GoogleFonts.tajawalTextTheme(),
            backgroundColor: Colors.white,
            primarySwatch: Colors.grey),
        home: SplashSCreen()
        // MyHomePage(title: 'Collection'),
        );
  }
}
