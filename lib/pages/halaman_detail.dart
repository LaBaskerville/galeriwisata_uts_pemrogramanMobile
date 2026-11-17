import 'package:flutter/material.dart';
import '../models/wisata.dart';
import '../widgets/gambar_wisata.dart';

/// Halaman detail yang dibuka lewat onTap pada kartu.
class HalamanDetail extends StatelessWidget {
  final Wisata wisata;

  const HalamanDetail({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(wisata.nama)),
      body: ListView(
        children: [
          Hero(
            tag: 'gambar-${wisata.nama}',
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: GambarWisata(wisata: wisata),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(wisata.nama, style: tema.textTheme.headlineSmall),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: [
                    Chip(
                      avatar: Icon(wisata.ikon, size: 18),
                      label: Text(wisata.kategori),
                    ),
                    Chip(
                      avatar: const Icon(Icons.confirmation_number, size: 18),
                      label: Text('Tiket: ${wisata.tiket}'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Lokasi'),
                    subtitle: Text('${wisata.lokasi}, Surabaya'),
                  ),
                ),
                const SizedBox(height: 12),
                Text('Tentang', style: tema.textTheme.titleMedium),
                const SizedBox(height: 6),
                Text(wisata.deskripsi, style: tema.textTheme.bodyLarge),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Kembali ke galeri'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}