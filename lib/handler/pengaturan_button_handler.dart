import 'package:flutter/material.dart';
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
      title: Text('Pengaturan Volume'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Geser slider untuk mengatur volume:'),
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
          child: Text('Tutup'),
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
