import 'package:flutter/material.dart';

/// Model data satu destinasi wisata.
/// (Peran: Data & Model)
class Wisata {
  final String nama;
  final String kategori;
  final String lokasi;
  final String deskripsi;
  final String tiket;

  /// Boleh URL (https://.../) atau path aset (assets/images/xxx.jpg).
  final String gambar;

  /// Ikon cadangan bila gambar gagal dimuat.
  final IconData ikon;

  const Wisata({
    required this.nama,
    required this.kategori,
    required this.lokasi,
    required this.deskripsi,
    required this.tiket,
    required this.gambar,
    required this.ikon,
  });
}
