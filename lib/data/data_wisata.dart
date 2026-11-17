import 'package:flutter/material.dart';
import '../models/wisata.dart';

/// Helper agar URL gambar tidak panjang berulang.
/// GANTI nama file / URL dengan gambar yang sudah Anda cek sendiri,
/// atau pakai aset lokal: 'assets/images/tugu_pahlawan.jpg'.
String _commons(String file) =>
    'https://commons.wikimedia.org/wiki/Special:FilePath/$file?width=800';

/// Daftar wisata (10 item, syarat minimal 8).
final List<Wisata> daftarWisata = [
  Wisata(
    nama: 'Tugu Pahlawan',
    kategori: 'Sejarah',
    lokasi: 'Jl. Pahlawan, Bubutan',
    deskripsi:
    'Monumen peringatan Pertempuran 10 November 1945 yang menjadi simbol '
        'Kota Pahlawan. Di bawah tugu terdapat Museum Sepuluh Nopember yang '
        'menyimpan diorama dan arsip perjuangan arek-arek Suroboyo.',
    tiket: 'Cek info resmi',
    gambar: 'assets/Tugu_Pahlawan_Surabaya.jpg',
    ikon: Icons.account_balance,
  ),
  Wisata(
    nama: 'Monumen Kapal Selam',
    kategori: 'Sejarah',
    lokasi: 'Jl. Pemuda, Embong Kaliasin',
    deskripsi:
    'Museum unik berupa kapal selam KRI Pasopati 410 yang didaratkan di '
        'tepi Kali Mas. Pengunjung dapat masuk dan melihat ruang-ruang di '
        'dalam kapal seperti ruang torpedo dan ruang kemudi.',
    tiket: 'Cek info resmi',
    gambar: 'assets/Museum-dan-Monumen-Kapal-di-Indonesia-Destinasi-Wisata-Tipis-tipis-saat-Ramadan-2-819x1024-1.jpg',
    ikon: Icons.directions_boat,
  ),
  Wisata(
    nama: 'House of Sampoerna',
    kategori: 'Sejarah',
    lokasi: 'Taman Sampoerna 6, Krembangan',
    deskripsi:
    'Museum di bangunan kolonial bergaya Belanda yang menceritakan '
        'sejarah industri rokok kretek di Indonesia. Pengunjung bisa melihat '
        'langsung para pelinting bekerja dari lantai atas.',
    tiket: 'Gratis',
    gambar: 'assets/House_of_Sampoerna_Mei_2015.jpg',
    ikon: Icons.museum,
  ),
  Wisata(
    nama: 'Kebun Binatang Surabaya',
    kategori: 'Edukasi',
    lokasi: 'Jl. Setail No. 1, Darmo',
    deskripsi:
    'Salah satu kebun binatang tertua dan terluas di Indonesia dengan '
        'koleksi satwa dari berbagai penjuru dunia. Cocok untuk wisata '
        'keluarga dan edukasi anak.',
    tiket: 'Cek info resmi',
    gambar: 'assets/wp-21145-21115.jpg',
    ikon: Icons.pets,
  ),
  Wisata(
    nama: 'Jembatan Suroboyo',
    kategori: 'Kota',
    lokasi: 'Pantai Kenjeran, Jl. Kenjeran',
    deskripsi:
    'Jembatan pejalan kaki di tepi laut Kenjeran dengan lengkungan '
        'berwarna dan air mancur menari. Ramai dikunjungi saat sore hingga '
        'malam untuk menikmati suasana pantai.',
    tiket: 'Cek info resmi',
    gambar: 'assets/images.jpg',
    ikon: Icons.water,
  ),
  Wisata(
    nama: 'Taman Bungkul',
    kategori: 'Taman',
    lokasi: 'Jl. Raya Darmo, Darmo',
    deskripsi:
    'Taman kota yang asri dan ramah keluarga, lengkap dengan area '
        'olahraga, skatepark, dan pusat jajanan. Pernah meraih penghargaan '
        'Asian Townscape Award.',
    tiket: 'Gratis',
    gambar: 'assets/Taman-Bungkul-di-Malam-Hari.-Foto-Gmap-J.-Ansori.jpg',
    ikon: Icons.park,
  ),
  Wisata(
    nama: 'Masjid Al-Akbar',
    kategori: 'Religi',
    lokasi: 'Jl. Masjid Al-Akbar Timur, Gayungan',
    deskripsi:
    'Masjid Agung Surabaya dengan kubah biru besar dan menara setinggi '
        'sekitar 99 meter. Salah satu masjid terbesar di Indonesia dan '
        'menjadi ikon wisata religi kota.',
    tiket: 'Gratis',
    gambar: 'assets/Masjid_Nasional_Al-Akbar_Surabaya_2016.jpg',
    ikon: Icons.mosque,
  ),
  Wisata(
    nama: 'Klenteng Sanggar Agung',
    kategori: 'Religi',
    lokasi: 'Jl. Sukolilo, Kenjeran',
    deskripsi:
    'Klenteng di tepi laut Kenjeran dengan arsitektur khas Tionghoa dan '
        'patung Dewi Kwan Im berukuran besar yang menghadap ke pantai.',
    tiket: 'Cek info resmi',
    gambar: 'assets/Giant_She_Mien_Fo_Statue_at_Sanggar_Agung_Temple,_Surabaya,_Indonesia.jpg',
    ikon: Icons.temple_buddhist,
  ),
  Wisata(
    nama: 'Ekowisata Mangrove Wonorejo',
    kategori: 'Alam',
    lokasi: 'Wonorejo, Rungkut',
    deskripsi:
    'Kawasan hutan mangrove di pesisir timur Surabaya dengan jalur '
        'trekking dan perahu menyusuri muara. Tempat yang baik untuk '
        'mengamati burung dan belajar konservasi pesisir.',
    tiket: 'Cek info resmi',
    gambar: 'assets/hutan-mangrove-wonorejo-1200.jpg',
    ikon: Icons.forest,
  ),
  Wisata(
    nama: 'Jalan Tunjungan',
    kategori: 'Kota',
    lokasi: 'Jl. Tunjungan, Genteng',
    deskripsi:
    'Jalan bersejarah di pusat kota dengan deretan bangunan tua, kafe, '
        'dan spot foto. Terkenal pula karena berdekatan dengan Hotel '
        'Majapahit, lokasi insiden bendera 1945.',
    tiket: 'Gratis',
    gambar: 'assets/images (1).jpg',
    ikon: Icons.location_city,
  ),
];