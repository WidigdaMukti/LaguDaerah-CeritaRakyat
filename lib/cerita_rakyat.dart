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
    'Cerita Rakyat Kurikulum': null,
    'Cerita Rakyat Umum': null,
  };

  Map<String, bool?> isExpanded = {
    'Cerita Rakyat Kurikulum': false,
    'Cerita Rakyat Umum': false,
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
          data['cerita_rakyat_kurikulum'];
      ceritaRakyatData['Cerita Rakyat Umum'] = data['cerita_rakyat_umum'];
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
        title: Text('Cerita Rakyat',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView(
        children: ceritaRakyatData.keys.map((category) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  category,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                trailing: Icon(
                  isExpanded[category] == true
                      ? Icons.expand_less
                      : Icons.expand_more,
                ),
                onTap: () {
                  // Toggle the visibility of the list and update the icon
                  setState(() {
                    isExpanded[category] = !(isExpanded[category] ?? false);
                  });
                },
              ),
              if (isExpanded[category] == true)
                Column(
                  children: ceritaRakyatData[category]?.map((cerita) {
                        return ListTile(
                          title: Text(
                            cerita['judul'],
                            style: GoogleFonts.poppins(),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailCeritaRakyatPage(ceritaData: cerita),
                              ),
                            );
                          },
                        );
                      }).toList() ??
                      [],
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
