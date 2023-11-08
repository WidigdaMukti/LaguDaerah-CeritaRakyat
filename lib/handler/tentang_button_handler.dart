import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showAboutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        title: Text(
          'Tentang Aplikasi',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.circular(12)),
            Image.asset(
              'assets/perancang.jpg',
              height: 200,
              width: 150,
            ),
            SizedBox(height: 10),
            Text(
              'Nama Perancang: Nama Anda',
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Deskripsi: Deskripsi singkat tentang perancang.',
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Tutup',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    },
  );
}
