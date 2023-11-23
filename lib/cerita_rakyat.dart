import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
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
    'Cerita Rakyat Kurikulum': null,
    'Cerita Rakyat Umum': null,
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
      ceritaRakyatData['Cerita Rakyat Kurikulum'] =
          data['Cerita_Rakyat_Kurikulum'];
      ceritaRakyatData['Cerita Rakyat Umum'] = data['Cerita_Rakyat_Umum'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset(
                  'assets/kids-6.svg',
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(
                  'assets/kids-5.svg',
                  height: 170,
                  width: 170,
                ),
              ),
            ),
            ListView(
              children: ceritaRakyatData.keys.map((category) {
                return Column(
                  children: [
                    SizedBox(height: 16.0), // Memberi jarak antara kategori
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            12.0), // Menambahkan border radius di sini
                        color: Colors.blue.withOpacity(0.5),
                      ),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(
                            horizontal: 16.0), // Padding horizontal
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
                                child: Container(
                                  // color: Colors.blue.withOpacity(
                                  //     0.3), // Warna biru dengan opasitas 50%
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 16.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(cerita['Judul'],
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white),
                                                fontSize: 16.0)),
                                      ),
                                      // Icon(
                                      //   Icons.arrow_forward,
                                      //   color: Colors.white, // Icon putih
                                      // ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList() ??
                            [],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
