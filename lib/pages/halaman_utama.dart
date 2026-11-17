import 'package:flutter/material.dart';
import '../data/data_wisata.dart';
import '../models/wisata.dart';
import '../widgets/gambar_wisata.dart';
import 'halaman_detail.dart';

/// Halaman utama: pencarian + filter kategori + Grid/List builder.
/// (Peran: UI Developer)
class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  String _kataKunci = '';
  String _kategori = 'Semua';
  bool _tampilGrid = true;

  // Daftar kategori diambil otomatis dari data.
  late final List<String> _daftarKategori = [
    'Semua',
    ...{for (final w in daftarWisata) w.kategori},
  ];

  List<Wisata> get _hasil => daftarWisata.where((w) {
    final cocokKategori = _kategori == 'Semua' || w.kategori == _kategori;
    final q = _kataKunci.toLowerCase();
    final cocokCari = w.nama.toLowerCase().contains(q) ||
        w.lokasi.toLowerCase().contains(q);
    return cocokKategori && cocokCari;
  }).toList();

  void _bukaDetail(Wisata w) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HalamanDetail(wisata: w)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasil = _hasil;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri Wisata Surabaya'),
        actions: [
          IconButton(
            tooltip: _tampilGrid ? 'Tampilan daftar' : 'Tampilan galeri',
            icon: Icon(_tampilGrid ? Icons.view_list : Icons.grid_view),
            onPressed: () => setState(() => _tampilGrid = !_tampilGrid),
          ),
        ],
      ),
      body: Column(
        children: [
          // --- Kolom pencarian ---
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: TextField(
              onChanged: (v) => setState(() => _kataKunci = v),
              decoration: InputDecoration(
                hintText: 'Cari nama atau lokasi wisata...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),

          // --- Filter kategori ---
          SizedBox(
            height: 52,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: _daftarKategori.length,
              separatorBuilder: (context, i) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final k = _daftarKategori[i];
                return ChoiceChip(
                  label: Text(k),
                  selected: _kategori == k,
                  onSelected: (_) => setState(() => _kategori = k),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${hasil.length} destinasi',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),

          // --- Daftar dinamis ---
          Expanded(
            child: hasil.isEmpty
                ? const _KosongView()
                : (_tampilGrid ? _buildGrid(hasil) : _buildList(hasil)),
          ),
        ],
      ),
    );
  }

  // GridView.builder: kartu = Card > Column(gambar + ListTile)
  Widget _buildGrid(List<Wisata> data) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.78,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: data.length,
      itemBuilder: (context, i) {
        final w = data[i];
        return Card(
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          child: InkWell(
            onTap: () => _bukaDetail(w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Hero(
                    tag: 'gambar-${w.nama}',
                    child: GambarWisata(wisata: w),
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    w.nama,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    w.kategori,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ListView.builder: kartu = Card > ListTile
  Widget _buildList(List<Wisata> data) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      itemCount: data.length,
      itemBuilder: (context, i) {
        final w = data[i];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 72,
                height: 72,
                child: Hero(
                  tag: 'gambar-${w.nama}',
                  child: GambarWisata(wisata: w),
                ),
              ),
            ),
            title: Text(
              w.nama,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${w.kategori}  •  ${w.lokasi}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _bukaDetail(w),
          ),
        );
      },
    );
  }
}

class _KosongView extends StatelessWidget {
  const _KosongView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off,
              size: 56, color: Theme.of(context).colorScheme.outline),
          const SizedBox(height: 8),
          const Text('Wisata tidak ditemukan'),
        ],
      ),
    );
  }
}