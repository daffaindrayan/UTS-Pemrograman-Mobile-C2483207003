
import 'package:flutter/material.dart';
import '../models/tugas.dart';

class DetailTugasScreen extends StatelessWidget {
  final Tugas tugas;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const DetailTugasScreen({
    super.key,
    required this.tugas,
    required this.onEdit,
    required this.onDelete,
  });

  Widget informasi(String label, String isi, IconData ikon) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(ikon, color: Colors.deepPurple, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  isi,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void konfirmasiHapus(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Hapus Tugas?'),
          content: const Text(
            'Apakah Anda yakin ingin menghapus tugas ini?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                onDelete();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),

                  const Center(
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Color(0xFFE8E3FF),
                      child: Icon(
                        Icons.assignment,
                        size: 36,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    tugas.judul,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  informasi(
                    'Mata Kuliah',
                    tugas.mataKuliah,
                    Icons.book,
                  ),

                  informasi(
                    'Deskripsi Tugas',
                    tugas.deskripsi,
                    Icons.description,
                  ),

                  informasi(
                    'Tenggat',
                    tugas.tenggat,
                    Icons.calendar_month,
                  ),

                  informasi(
                    'Prioritas',
                    tugas.prioritas,
                    Icons.flag,
                  ),

                  informasi(
                    'Status',
                    tugas.selesai ? 'Selesai' : 'Belum Selesai',
                    Icons.check_circle,
                  ),

                  const SizedBox(height: 6),

                  SizedBox(
                    height: 44,
                    child: ElevatedButton.icon(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit Tugas'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  SizedBox(
                    height: 44,
                    child: OutlinedButton.icon(
                      onPressed: () => konfirmasiHapus(context),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      label: const Text(
                        'Hapus Tugas',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
