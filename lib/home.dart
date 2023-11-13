import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'menu.dart';
import 'handler/pengaturan_button_handler.dart';
import 'handler/tentang_button_handler.dart' as AboutHandler;
import 'handler/keluar_button_handler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: AppTheme.backgroundcolor1(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: Container(
        // decoration: AppTheme.gradientBackground(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: FractionalTranslation(
                translation: Offset(0.0,
                    0.03), // Sesuaikan dengan seberapa besar bagian bawah yang ingin dipotong
                child: SvgPicture.asset(
                  'assets/kids-1.svg',
                  width: 280,
                  height: 280,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: FractionalTranslation(
                translation: Offset(0.2,
                    0.0), // Sesuaikan dengan seberapa besar bagian bawah yang ingin dipotong
                child: SvgPicture.asset(
                  'assets/kids-2.svg',
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/title2.svg",
                    height: 90,
                    width: 90,
                  ),
                  // Text(
                  //   'Cerita Rakyat & Lagu Daerah',
                  //   style: GoogleFonts.poppins(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.bold,
                  //   ),
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
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => handleSettingsButtonPress(context),
                    child: Text(
                      'Pengaturan',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => AboutHandler.showAboutDialog(context),
                    child: Text(
                      'Tentang',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      bool exit = await showExitConfirmationDialog(context);
                      if (exit) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      'Keluar',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
