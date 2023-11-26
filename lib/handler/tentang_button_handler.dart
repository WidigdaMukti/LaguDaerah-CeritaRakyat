import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showAboutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        title: Text(
          'Tentang Aplikasi',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/perancang.jpg',
                    height: 200,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
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
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Tutup',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: const BorderSide(
                  color: Colors.indigo,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
