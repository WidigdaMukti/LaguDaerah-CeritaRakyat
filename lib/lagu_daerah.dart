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
      laguDaerahData['Sesuai Kurikulum'] = data['lagu_daerah_kurikulum'];
      laguDaerahData['Umum'] = data['lagu_daerah_umum'];
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
        title: Text('Lagu Daerah',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView(
        children: laguDaerahData.keys.map((category) {
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
                  children: laguDaerahData[category]?.map((lagu) {
                        return ListTile(
                          title: Text(
                            lagu['judul'],
                            style: GoogleFonts.poppins(),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailLaguPage(laguData: lagu),
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
