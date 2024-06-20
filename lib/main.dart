import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:onlineshopping/firebase_options.dart';
import 'package:onlineshopping/provider/ProductProvider.dart';
import 'package:onlineshopping/screens/SplashScreen.dart';
import 'package:onlineshopping/utils/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( const MyApp());
}
    

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductProvider()),
        ],
        child: MixTheme(
          data: lightBlueTheme,
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ),
      )
    );
  }
}
