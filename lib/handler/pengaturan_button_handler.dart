import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:volume_control/volume_control.dart';

class SettingsDialog extends StatefulWidget {
  @override
  _SettingsDialogState createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  double _val = 0.5;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    initVolumeState();
  }

  // Inisialisasi volume_control plugin
  Future<void> initVolumeState() async {
    if (!mounted) return;

    // Baca volume saat ini
    _val = await VolumeControl.volume;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        // side: BorderSide(
        //   color: Colors.blue, // Warna stroke
        //   width: 2, // Lebar stroke
        // ),
      ),
      title: Text(
        'Pengaturan Volume',
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Geser slider untuk mengatur volume:',
            style: GoogleFonts.poppins(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 32),
          Slider(
            value: _val,
            min: 0,
            max: 1,
            divisions: 100,
            onChanged: (val) {
              _val = val;
              setState(() {});
              timer
                  ?.cancel(); // Menggunakan ? untuk memeriksa apakah timer null
              timer = Timer(Duration(milliseconds: 200), () {
                VolumeControl.setVolume(val);
              });

              print("val: $val");
            },
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
  }
}

void handleSettingsButtonPress(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return SettingsDialog();
    },
  );
}
