import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'detail_cerita.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CeritaRakyatPage(),
    );
  }
}

class CeritaRakyatPage extends StatefulWidget {
  @override
  _CeritaRakyatPageState createState() => _CeritaRakyatPageState();
}

class _CeritaRakyatPageState extends State<CeritaRakyatPage> {
  Map<String, List<dynamic>?> ceritaRakyatData = {
    'Sesuai Kurikulum': null,
    'Umum': null,
  };

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonData = await rootBundle.loadString('assets/data/cerita.json');
    Map<String, dynamic> data = json.decode(jsonData);
    setState(() {
      ceritaRakyatData['Sesuai Kurikulum'] = data['Cerita_Rakyat_Kurikulum'];
      ceritaRakyatData['Umum'] = data['Cerita_Rakyat_Umum'];
    });
  }

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
          title: Text(
            'Cerita Rakyat',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black],
                      stops: [0.1, 1.0],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/back-cerita.png',
                  ),
                )),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/kids-6.png',
                  height: 200,
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/kids-5.png',
                  height: 150,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: ListView(
                children: ceritaRakyatData.keys.map((category) {
                  return Column(
                    children: [
                      const SizedBox(
                          height: 16.0), // Memberi jarak antara kategori
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Container(
                          color: Colors.indigo.withOpacity(0.5),
                          child: ExpansionTile(
                            shape:
                                Border.all(width: 0, color: Colors.transparent),
                            tilePadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            backgroundColor: Colors.transparent,
                            title: Text(
                              category,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            children: ceritaRakyatData[category]?.map((cerita) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailCeritaRakyatPage(
                                            ceritaData: cerita,
                                          ),
                                        ),
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(12.0),
                                        bottomRight: Radius.circular(12.0),
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        color: Colors
                                            .transparent, // Mengatur latar belakang menjadi transparan
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12.0,
                                            horizontal: 16.0,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  cerita['Judul'],
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white),
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList() ??
                                [],
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ));
  }
}
