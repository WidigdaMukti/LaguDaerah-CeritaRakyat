import 'package:flutter/material.dart';
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
      body: Container(
        // decoration: AppTheme.gradientBackground(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: FractionalTranslation(
                translation: const Offset(-0.15,
                    0.03), // Sesuaikan dengan seberapa besar bagian bawah yang ingin dipotong
                child: Image.asset(
                  'assets/kids-1.png',
                  width: 280,
                  height: 280,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: FractionalTranslation(
                translation: const Offset(0.21,
                    0.0), // Sesuaikan dengan seberapa besar bagian bawah yang ingin dipotong
                child: Image.asset(
                  'assets/kids-2.png',
                  width: 210,
                  height: 210,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/title3.png",
                    width: 340,
                  ),
                  const SizedBox(height: 28),
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
                      minimumSize: const Size(200, 50),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                      minimumSize: const Size(200, 50),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                      minimumSize: const Size(200, 50),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                      backgroundColor: Colors.white,
                      minimumSize: const Size(200, 50),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: const BorderSide(
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
