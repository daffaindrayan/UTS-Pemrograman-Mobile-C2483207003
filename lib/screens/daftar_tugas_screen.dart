
import 'package:flutter/material.dart';
import '../models/tugas.dart';
import 'form_tugas_screen.dart';
import 'detail_tugas_screen.dart';

class DaftarTugasScreen extends StatefulWidget {
  const DaftarTugasScreen({super.key});

  @override
  State<DaftarTugasScreen> createState() => _DaftarTugasScreenState();
}

class _DaftarTugasScreenState extends State<DaftarTugasScreen> {
  final List<Tugas> daftarTugas = [
    Tugas(
      id: '1',
      judul: 'Membuat Makalah Flutter',
      mataKuliah: 'Pemrograman Mobile',
      deskripsi: 'Membuat makalah tentang dasar Flutter dan Dart.',
      tenggat: '25-11-2026',
      prioritas: 'Tinggi',
    ),
    Tugas(
      id: '2',
      judul: 'Membuat Desain UI',
      mataKuliah: 'Desain Antarmuka',
      deskripsi: 'Membuat rancangan UI aplikasi mobile.',
      tenggat: '27-11-2026',
      prioritas: 'Sedang',
    ),
    Tugas(
      id: '3',
      judul: 'Laporan Praktikum',
      mataKuliah: 'Basis Data',
      deskripsi: 'Menyelesaikan laporan praktikum basis data.',
      tenggat: '30-11-2026',
      prioritas: 'Rendah',
    ),
  ];

  int get jumlahSelesai =>
      daftarTugas.where((t) => t.selesai).length;

  int get jumlahBelum =>
      daftarTugas.where((t) => !t.selesai).length;

  void bukaForm({Tugas? tugas}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FormTugasScreen(
          tugas: tugas,
          onSave: (data) {
            setState(() {
              if (tugas == null) {
                daftarTugas.add(data);
              } else {
                final index = daftarTugas.indexWhere(
                      (item) => item.id == tugas.id,
                );
                if (index != -1) {
                  daftarTugas[index] = data;
                }
              }
            });
          },
        ),
      ),
    );
  }

  void bukaDetail(Tugas tugas) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailTugasScreen(
          tugas: tugas,
          onEdit: () {
            Navigator.pop(context);
            bukaForm(tugas: tugas);
          },
          onDelete: () {
            setState(() {
              daftarTugas.removeWhere(
                    (item) => item.id == tugas.id,
              );
            });

            Navigator.pop(context);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Tugas berhasil dihapus'),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5FC),
      appBar: AppBar(
        title: const Text(
          'TugasKu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF6558D3),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF6558D3),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Halo, Mahasiswa! 👋',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Jangan lupa selesaikan tugas kuliahmu.',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    kartuRingkasan('Total', daftarTugas.length),
                    const SizedBox(width: 10),
                    kartuRingkasan('Selesai', jumlahSelesai),
                    const SizedBox(width: 10),
                    kartuRingkasan('Belum', jumlahBelum),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              'Daftar Tugas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: daftarTugas.isEmpty
                ? const Center(
              child: Text(
                'Belum ada tugas. Yuk, tambahkan tugas!',
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.fromLTRB(
                16, 0, 16, 16,
              ),
              itemCount: daftarTugas.length,
              itemBuilder: (context, index) {
                final tugas = daftarTugas[index];

                final warna = tugas.prioritas == 'Tinggi'
                    ? Colors.red
                    : tugas.prioritas == 'Sedang'
                    ? Colors.orange
                    : Colors.green;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(14),
                    onTap: () => bukaDetail(tugas),
                    leading: CircleAvatar(
                      backgroundColor:
                      warna.withValues(alpha: 0.15),
                      child: Icon(
                        Icons.assignment,
                        color: warna,
                      ),
                    ),
                    title: Text(
                      tugas.judul,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        '${tugas.mataKuliah}\n'
                            'Tenggat: ${tugas.tenggat}\n'
                            'Prioritas: ${tugas.prioritas}\n'
                            'Status: ${tugas.selesai ? "Selesai" : "Belum selesai"}',
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => bukaForm(),
        backgroundColor: const Color(0xFF6558D3),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Tugas'),
      ),
    );
  }

  Widget kartuRingkasan(String judul, int jumlah) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              '$jumlah',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              judul,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
