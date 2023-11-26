import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cerita_rakyat.dart';
import 'lagu_daerah.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 34,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Menu',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 350,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.scale(
                          scale: 1.08,
                          child: Image.asset(
                            'assets/lagu.png',
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 10,
                    bottom: 10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        elevation: 4,
                        padding: EdgeInsets.all(10.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LaguDaerahPage()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 4),
                          Text(
                            "Lagu Daerah",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  width: 350,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.scale(
                          scale: 1.08,
                          child: Image.asset(
                            'assets/cerita.png',
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 10,
                    bottom: 10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        elevation: 4,
                        padding: EdgeInsets.all(10.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CeritaRakyatPage()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 4),
                          Text(
                            "Cerita Rakyat",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
