import 'package:flutter/material.dart';
import 'package:uni_hub/app_theme.dart';
import 'package:uni_hub/home.dart';
import 'package:uni_hub/login.dart';
import 'package:uni_hub/notesScreen.dart';
import 'package:uni_hub/pdf_screen.dart';
import 'package:uni_hub/projectsScreen.dart';
import 'package:uni_hub/pyqScreen.dart';
import 'package:uni_hub/signup.dart';
import 'package:uni_hub/upload_materials_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uni Hub',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(
              isDarkMode: _isDarkMode,
              onThemeChanged: (bool value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
        '/upload': (context) => UploadScreen(),
        '/projects': (context) => ProjectsScreen(),
        '/pyqs': (context) => PyqScreen(),
        '/notes': (context) => NotesScreen(),
        '/pdf': (context) => PdfScreen(),
      },
    );
  }
}
