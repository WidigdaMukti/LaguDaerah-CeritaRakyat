import 'package:flutter/material.dart';
import 'menu.dart';
import 'handler/pengaturan_button_handler.dart';
import 'handler/tentang_button_handler.dart' as AboutHandler;
import 'handler/keluar_button_handler.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
                'Cerita Rakyat & Lagu Daerah',
                style: GoogleFonts.poppins(
                  fontSize: 24, // Ganti sesuai ukuran yang Anda inginkan
                  fontWeight: FontWeight.bold, // Ganti sesuai kebutuhan Anda
                ),
              ),
              // SvgPicture.asset(
              //   'assets/home-title.svg', // Ganti dengan path gambar SVG yang sesuai
              //   width: 100, // Sesuaikan ukuran gambar sesuai keinginan Anda
              //   height: 100, // Sesuaikan ukuran gambar sesuai keinginan Anda
              // ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen()),
                  );
                },
                child: Text(
                  'Mulai',
                  style: GoogleFonts.poppins(
                    fontSize: 16, // Ganti sesuai ukuran yang Anda inginkan
                    fontWeight: FontWeight.bold, // Ganti sesuai kebutuhan Anda
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(130, 40),
                  primary: Colors
                      .white, // Ganti dengan warna latar belakang yang Anda inginkan
                  onPrimary: Colors
                      .black, // Ganti dengan warna teks yang Anda inginkan
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12), // Ganti dengan border radius yang sesuai
                    side: BorderSide(
                        color: Colors.black,
                        width:
                            1), // Ganti dengan warna dan lebar stroke yang sesuai
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => handleSettingsButtonPress(context),
                child: Text(
                  'Pengaturan',
                  style: GoogleFonts.poppins(
                    fontSize: 16, // Ganti sesuai ukuran yang Anda inginkan
                    fontWeight: FontWeight.bold, // Ganti sesuai kebutuhan Anda
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(130, 40),
                  primary: Colors
                      .white, // Ganti dengan warna latar belakang yang Anda inginkan
                  onPrimary: Colors
                      .black, // Ganti dengan warna teks yang Anda inginkan
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12), // Ganti dengan border radius yang sesuai
                    side: BorderSide(
                        color: Colors.black,
                        width:
                            1), // Ganti dengan warna dan lebar stroke yang sesuai
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => AboutHandler.showAboutDialog(context),
                child: Text(
                  'Tentang',
                  style: GoogleFonts.poppins(
                    fontSize: 16, // Ganti sesuai ukuran yang Anda inginkan
                    fontWeight: FontWeight.bold, // Ganti sesuai kebutuhan Anda
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(130, 40),
                  primary: Colors
                      .white, // Ganti dengan warna latar belakang yang Anda inginkan
                  onPrimary: Colors
                      .black, // Ganti dengan warna teks yang Anda inginkan
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12), // Ganti dengan border radius yang sesuai
                    side: BorderSide(
                        color: Colors.black,
                        width:
                            1), // Ganti dengan warna dan lebar stroke yang sesuai
                  ),
                ),
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
                child: Text(
                  'Keluar',
                  style: GoogleFonts.poppins(
                    fontSize: 16, // Ganti sesuai ukuran yang Anda inginkan
                    fontWeight: FontWeight.bold, // Ganti sesuai kebutuhan Anda
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(130, 40),
                  primary: Colors
                      .white, // Ganti dengan warna latar belakang yang Anda inginkan
                  onPrimary: Colors
                      .black, // Ganti dengan warna teks yang Anda inginkan
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12), // Ganti dengan border radius yang sesuai
                    side: BorderSide(
                        color: Colors.black,
                        width:
                            1), // Ganti dengan warna dan lebar stroke yang sesuai
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
