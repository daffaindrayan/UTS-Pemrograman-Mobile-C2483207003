
import 'package:flutter/material.dart';
import 'screens/daftar_tugas_screen.dart';

void main() {
  runApp(const TugasKuApp());
}

class TugasKuApp extends StatelessWidget {
  const TugasKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TugasKu',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF6558D3),
        fontFamily: 'Roboto',
      ),
      home: const DaftarTugasScreen(),
    );
  }
}
