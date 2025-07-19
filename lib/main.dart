import 'package:flutter/material.dart';
import 'pages/portaria_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portaria App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF4D7408), // Verde institucional
        scaffoldBackgroundColor: const Color(0xFFCCCCCC), // Cinza claro de fundo
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF905524), // Marrom (botão)
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4D7408), // Verde
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF905524), // cor de destaque
        ),
      ),
      home: const PortariaPage(),
    );
  }
}
