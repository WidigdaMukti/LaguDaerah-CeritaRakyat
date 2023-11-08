import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<bool> showExitConfirmationDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        title: Text(
          'Konfirmasi Keluar',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        content: Text(
          'Apakah Anda yakin ingin keluar dari aplikasi?',
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Kembali ke tampilan semula
            },
            child: Text(
              'Tidak',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Keluar dari aplikasi
            },
            child: Text(
              'Ya',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    },
  );
}
