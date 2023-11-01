import 'package:flutter/material.dart';
import 'menu.dart';
import 'handler/pengaturan_button_handler.dart';
import 'handler/tentang_button_handler.dart' as AboutHandler;
import 'handler/keluar_button_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghapus tombol kembali
        toolbarHeight: 0, // Menghapus AppBar
        // title: Text('Aplikasi Lagu Daerah & Cerita Rakyat'),
        // backgroundColor: Colors.green, // Ubah sesuai keinginan Anda
      ),
      body: Container(
        color: Colors.white, // Mengubah latar belakang menjadi warna putih
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(
        //         'assets/background_image.jpg'), // Ganti dengan gambar latar belakang yang Anda miliki
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Aplikasi Lagu Daerah & Cerita Rakyat',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen()),
                  );
                },
                child: Text('Mulai'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => handleSettingsButtonPress(context),
                child: Text('Pengaturan'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => AboutHandler.showAboutDialog(context),
                child: Text('Tentang'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  bool exit = await showExitConfirmationDialog(context);
                  if (exit) {
                    // Keluar dari aplikasi
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Keluar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
