import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'Presentation/home_page.dart';
import 'Provider/StateProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => StateProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      /// ✅ EasyLoading.init() initialise the EasyLoading object of EasyLoading Package inside builder which Ensures that EasyLoading
      /// overlays work throughout the app... can show on top of all screen globally without dialog etc
      /// ✅ builder in MaterialApp = Allows wrapping the entire app with a custom widget, in this case, initializing EasyLoading.
      builder: EasyLoading.init(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark
        ),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}
