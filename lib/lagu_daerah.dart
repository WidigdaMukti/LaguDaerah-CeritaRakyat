import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'detail_lagu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LaguDaerahPage(),
    );
  }
}

class LaguDaerahPage extends StatefulWidget {
  @override
  _LaguDaerahPageState createState() => _LaguDaerahPageState();
}

class _LaguDaerahPageState extends State<LaguDaerahPage> {
  Map<String, List<dynamic>?> laguDaerahData = {
    'Sesuai Kurikulum': null,
    'Umum': null,
  };
  Map<String, bool?> isExpanded = {
    'Sesuai Kurikulum': false,
    'Umum': false,
  };

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonData = await rootBundle.loadString('assets/data/lagu.json');
    Map<String, dynamic> data = json.decode(jsonData);
    setState(() {
      laguDaerahData['Sesuai Kurikulum'] = data['Lagu_Daerah_Kurikulum'];
      laguDaerahData['Umum'] = data['Lagu_Daerah_Umum'];
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
            'Lagu Daerah',
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
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black],
                      stops: [0.08, 0.8],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/img/menu-lagu.png',
                  ),
                )),
            // Positioned.fill(
            //   child: Align(
            //     alignment: Alignment.bottomRight,
            //     child: Image.asset(
            //       'assets/kids-4.png',
            //       height: 200,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: ListView(
                children: laguDaerahData.keys.map((category) {
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
                            children: laguDaerahData[category]?.map((lagu) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailLaguPage(
                                            laguData: lagu,
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
                                                  lagu['Judul'],
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
