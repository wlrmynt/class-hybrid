import 'package:flutter/material.dart';
import '../pages/detail_materi_page.dart'; // pastikan path ini benar

class MandiriScreen extends StatelessWidget {
  const MandiriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> materiMandiri = [
      {
        'judul': 'Pengenalan Flutter',
        'deskripsi':
            'Materi ini menjelaskan dasar-dasar Flutter dan komponennya.',
        'videoUrl':
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
      },
      {
        'judul': 'Widget Dasar Flutter',
        'deskripsi': 'Membahas widget-widget penting di Flutter.',
        'videoUrl':
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Mandiri'),
        backgroundColor: Colors.blue[600],
      ),
      body: ListView.builder(
        itemCount: materiMandiri.length,
        itemBuilder: (context, index) {
          final materi = materiMandiri[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text(materi['judul']!),
              subtitle: Text(materi['deskripsi']!),
              trailing: const Icon(Icons.play_circle_fill, color: Colors.blue),
              onTap: () {
                // ⬇️ Navigasi ke halaman detail
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
