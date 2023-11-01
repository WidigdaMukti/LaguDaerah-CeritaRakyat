import 'package:flutter/material.dart';

void showAboutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Tentang Aplikasi'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
                'assets/perancang.jpg'), // Ganti dengan path gambar perancang Anda
            SizedBox(height: 10),
            Text('Nama Perancang: Nama Anda'),
            SizedBox(height: 10),
            Text('Deskripsi: Deskripsi singkat tentang perancang.'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Tutup'),
          ),
        ],
      );
    },
  );
}
