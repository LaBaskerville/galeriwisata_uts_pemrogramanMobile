import 'package:flutter/material.dart';
import 'pages/halaman_utama.dart';

void main() => runApp(const GaleriWisataApp());

class GaleriWisataApp extends StatelessWidget {
  const GaleriWisataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeri Wisata Surabaya',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB71C1C)),
      ),
      home: const HalamanUtama(),
    );
  }
}
