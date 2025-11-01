import 'package:flutter/material.dart';

class MateriListPage extends StatelessWidget {
  const MateriListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final materiList = [
      "Pengantar Pemrograman",
      "Struktur Data Dasar",
      "Algoritma Dasar",
      "Pemrograman Berorientasi Objek",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Materi")),
      body: ListView.builder(
        itemCount: materiList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(materiList[index]),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/materi-detail',
              arguments: materiList[index],
            );
          },
        ),
      ),
    );
  }
}
