import 'package:flutter/material.dart';

class DetailMateriPage extends StatelessWidget {
  const DetailMateriPage({super.key});

  @override
  Widget build(BuildContext context) {
    final materiTitle = ModalRoute.of(context)!.settings.arguments ?? "Materi";

    return Scaffold(
      appBar: AppBar(title: Text(materiTitle.toString())),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          "Ini adalah halaman detail dari materi: $materiTitle",
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
