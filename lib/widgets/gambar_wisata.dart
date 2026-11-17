import 'package:flutter/foundation.dart' show kIsWeb, debugPrint;
import 'package:flutter/material.dart';
import '../models/wisata.dart';

/// Menampilkan gambar dari aset ATAU network.
/// Jika gagal dimuat, tampil ikon cadangan (aplikasi tidak error).
class GambarWisata extends StatelessWidget {
  final Wisata wisata;
  final BoxFit fit;

  const GambarWisata({super.key, required this.wisata, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    final cadangan = Container(
      color: warna.primaryContainer,
      alignment: Alignment.center,
      child: Icon(wisata.ikon, size: 40, color: warna.onPrimaryContainer),
    );

    if (wisata.gambar.startsWith('assets/')) {
      return Image.asset(
        wisata.gambar,
        fit: fit,
        errorBuilder: (context, error, stack) => cadangan,
      );
    }

    return Image.network(
      wisata.gambar,
      fit: fit,
      // Wikimedia memblokir permintaan tanpa User-Agent yang jelas.
      // (Di web, header ini tidak boleh diubah, jadi dilewati.)
      headers: kIsWeb
          ? null
          : const {
        'User-Agent':
        'GaleriWisataSurabaya/1.0 (tugas kuliah Pemrograman Mobile)',
      },
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        final total = progress.expectedTotalBytes;
        return Container(
          color: warna.surfaceContainerHighest,
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            value: total != null ? progress.cumulativeBytesLoaded / total : null,
            strokeWidth: 3,
          ),
        );
      },
      errorBuilder: (context, error, stack) {
        // Lihat penyebab gagal di tab Run/Debug Console.
        debugPrint('Gagal memuat gambar ${wisata.nama}: $error');
        return cadangan;
      },
    );
  }
}
