import 'package:flutter/material.dart';
import 'dart:math';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  final List<Map<String, String>> _classes = [
    {
      "title": "Pemrograman Dasar",
      "teacher": "Ibu Siti Rahma",
      "code": "ABC123",
    },
    {"title": "Jaringan Komputer", "teacher": "Pak Bambang", "code": "JK2025"},
  ];

  final TextEditingController _joinCodeController = TextEditingController();

  String _generateClassCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(6, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))),
    );
  }

  void _createClass(BuildContext context) {
    final titleController = TextEditingController();
    final teacherController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Buat Kelas Baru"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Nama Kelas"),
            ),
            TextField(
              controller: teacherController,
              decoration: const InputDecoration(labelText: "Nama Pengajar"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  teacherController.text.isNotEmpty) {
                setState(() {
                  _classes.add({
                    "title": titleController.text,
                    "teacher": teacherController.text,
                    "code": _generateClassCode(),
                  });
                });
                Navigator.pop(context);
              }
            },
            child: const Text("Buat"),
          ),
        ],
      ),
    );
  }

  void _joinClass(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Gabung Kelas"),
        content: TextField(
          controller: _joinCodeController,
          decoration: const InputDecoration(labelText: "Masukkan Kode Kelas"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _joinCodeController.clear();
              Navigator.pop(context);
            },
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () {
              final code = _joinCodeController.text.trim();
              final kelas = _classes.firstWhere(
                (c) => c["code"] == code,
                orElse: () => {},
              );
              if (kelas.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Berhasil bergabung ke ${kelas["title"]}!"),
                  ),
                );
                _joinCodeController.clear();
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Kode kelas tidak ditemukan!")),
                );
              }
            },
            child: const Text("Gabung"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ruang Kelas"),
        backgroundColor: const Color.fromARGB(255, 33, 112, 108),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => _createClass(context),
            tooltip: "Buat Kelas",
          ),
          IconButton(
            icon: const Icon(Icons.meeting_room_outlined),
            onPressed: () => _joinClass(context),
            tooltip: "Gabung Kelas",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _classes.isEmpty
            ? const Center(
                child: Text(
                  "Belum ada kelas.\nSilakan buat atau gabung kelas.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: _classes.length,
                itemBuilder: (context, index) {
                  final kelas = _classes[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: const Icon(
                        Icons.class_,
                        color: Color.fromARGB(255, 28, 102, 102),
                        size: 40,
                      ),
                      title: Text(
                        kelas["title"]!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        "Dosen: ${kelas["teacher"]!}\nKode: ${kelas["code"]!}",
                      ),
                      isThreeLine: true,
                      trailing: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Masuk ke ${kelas["title"]}"),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            38,
                            96,
                            103,
                          ),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Masuk"),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
