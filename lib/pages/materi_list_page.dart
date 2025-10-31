import 'package:flutter/material.dart';
import 'detail_materi_page.dart';

class MateriListPage extends StatelessWidget {
  const MateriListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar materi (dummy)
    final List<Map<String, String>> daftarMateri = [
      {
        'judul': 'Pengenalan Flutter',
        'deskripsi':
            'Materi ini menjelaskan dasar-dasar Flutter dan komponennya.',
        'videoUrl':
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
      },
      {
        'judul': 'Widget Dasar Flutter',
        'deskripsi': 'Penjelasan tentang widget-widget penting di Flutter.',
        'videoUrl':
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Materi"),
        backgroundColor: Colors.blue[600],
      ),
      body: ListView.builder(
        itemCount: daftarMateri.length,
        itemBuilder: (context, index) {
          final materi = daftarMateri[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text(materi['judul']!),
              subtitle: Text(materi['deskripsi']!),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                // ⬇️ DI SINI kamu taruh kode Navigator.push()
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailMateriPage(
                      judul: materi['judul']!,
                      deskripsi: materi['deskripsi']!,
                      videoUrl: materi['videoUrl']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
