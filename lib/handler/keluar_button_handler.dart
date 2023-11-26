import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

void keluarAplikasi() {
  SystemNavigator.pop();
}

Future<bool> showExitConfirmationDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        title: Text(
          'Konfirmasi Keluar',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        content: Text(
          'Apakah Anda yakin ingin keluar dari aplikasi?',
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Kembali ke tampilan semula
            },
            child: Text(
              'Tidak',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: const BorderSide(
                  color: Colors.indigo,
                  width: 1,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              keluarAplikasi(); // Keluar dari aplikasi
            },
            child: Text(
              'Ya',
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
