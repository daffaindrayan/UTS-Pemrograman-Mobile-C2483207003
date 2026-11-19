
import 'package:flutter/material.dart';
import '../models/tugas.dart';

class FormTugasScreen extends StatefulWidget {
  final Tugas? tugas;
  final Function(Tugas) onSave;

  const FormTugasScreen({
    super.key,
    this.tugas,
    required this.onSave,
  });

  @override
  State<FormTugasScreen> createState() => _FormTugasScreenState();
}

class _FormTugasScreenState extends State<FormTugasScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController judulController;
  late TextEditingController mataKuliahController;
  late TextEditingController deskripsiController;
  late TextEditingController tenggatController;

  String? prioritas;
  bool selesai = false;

  @override
  void initState() {
    super.initState();

    final tugas = widget.tugas;

    judulController = TextEditingController(text: tugas?.judul ?? '');
    mataKuliahController =
        TextEditingController(text: tugas?.mataKuliah ?? '');
    deskripsiController =
        TextEditingController(text: tugas?.deskripsi ?? '');
    tenggatController = TextEditingController(text: tugas?.tenggat ?? '');

    prioritas = tugas?.prioritas;
    selesai = tugas?.selesai ?? false;
  }

  @override
  void dispose() {
    judulController.dispose();
    mataKuliahController.dispose();
    deskripsiController.dispose();
    tenggatController.dispose();
    super.dispose();
  }

  String? validasiTenggat(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Tenggat wajib diisi';
    }

    final pola = RegExp(r'^\d{2}-\d{2}-\d{4}$');

    if (!pola.hasMatch(value)) {
      return 'Gunakan format DD-MM-YYYY';
    }

    final bagian = value.split('-');
    final hari = int.parse(bagian[0]);
    final bulan = int.parse(bagian[1]);
    final tahun = int.parse(bagian[2]);

    final tanggal = DateTime(tahun, bulan, hari);

    if (tanggal.day != hari ||
        tanggal.month != bulan ||
        tanggal.year != tahun) {
      return 'Tanggal tidak valid';
    }

    return null;
  }

  void simpanTugas() {
    if (!_formKey.currentState!.validate()) return;

    if (prioritas == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih prioritas tugas')),
      );
      return;
    }

    final tugas = Tugas(
      id: widget.tugas?.id ??
          DateTime.now().microsecondsSinceEpoch.toString(),
      judul: judulController.text.trim(),
      mataKuliah: mataKuliahController.text.trim(),
      deskripsi: deskripsiController.text.trim(),
      tenggat: tenggatController.text.trim(),
      prioritas: prioritas!,
      selesai: selesai,
    );

    widget.onSave(tugas);
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          widget.tugas == null
              ? 'Tugas berhasil ditambahkan'
              : 'Tugas berhasil diperbarui',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sedangEdit = widget.tugas != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(sedangEdit ? 'Edit Tugas' : 'Tambah Tugas'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: judulController,
              decoration: const InputDecoration(
                labelText: 'Judul Tugas',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.assignment),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Judul wajib diisi';
                }
                if (value.trim().length < 3) {
                  return 'Judul minimal 3 karakter';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: mataKuliahController,
              decoration: const InputDecoration(
                labelText: 'Mata Kuliah',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.book),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Mata kuliah wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: deskripsiController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Deskripsi Tugas',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
                alignLabelWithHint: true,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Deskripsi wajib diisi';
                }
                if (value.trim().length < 10) {
                  return 'Deskripsi minimal 10 karakter';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: tenggatController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                labelText: 'Tenggat (DD-MM-YYYY)',
                hintText: 'Contoh: 25-11-2026',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_month),
              ),
              validator: validasiTenggat,
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: prioritas,
              decoration: const InputDecoration(
                labelText: 'Prioritas',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.flag),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Rendah',
                  child: Text('Rendah'),
                ),
                DropdownMenuItem(
                  value: 'Sedang',
                  child: Text('Sedang'),
                ),
                DropdownMenuItem(
                  value: 'Tinggi',
                  child: Text('Tinggi'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  prioritas = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Pilih prioritas tugas';
                }
                return null;
              },
            ),

            if (sedangEdit) ...[
              const SizedBox(height: 12),
              SwitchListTile(
                title: const Text('Tugas sudah selesai'),
                value: selesai,
                onChanged: (value) {
                  setState(() {
                    selesai = value;
                  });
                },
              ),
            ],

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: simpanTugas,
                icon: const Icon(Icons.save),
                label: Text(
                  sedangEdit ? 'Simpan Perubahan' : 'Simpan Tugas',
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
