import 'package:flutter/material.dart';
import 'package:expenses_tracker/widgets/expenses.dart';
// import 'package:flutter/services.dart'; //for responsive and adaptive application //here it used to device orientation

var kColorScheme = ColorScheme.fromSeed(
    seedColor:
        const Color.fromARGB(255, 96, 59, 181)); //global variable starts with k
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized(); //this ensures lock the device orientation and then running the app as intented
  // SystemChrome.setPreferredOrientations([
  //   //lock device orientation with this
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  //it returns future so we use then...

  runApp(
    MaterialApp(
      //theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          //using copyWith we overright the theme of Appbartheme
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme
                    .secondaryContainer, //if color: Colors.red is not working because we set forground color for appbar
                fontSize: 16,
              ),
            ),
      ),
      //themeMode: ThemeMode.system,  //default its a system so no need
      home: const Expenses(),
    ),
  );

  // });
}
