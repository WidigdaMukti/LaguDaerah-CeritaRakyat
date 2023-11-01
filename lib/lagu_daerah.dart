import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
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
  List<dynamic> laguDaerahData = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonData = await rootBundle.loadString('assets/data/lagu.json');
    Map<String, dynamic> data = json.decode(jsonData);
    setState(() {
      laguDaerahData = data['lagu_daerah'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lagu Daerah'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: laguDaerahData.length,
              itemBuilder: (context, index) {
                final lagu = laguDaerahData[index];
                return ListTile(
                  title: Text(lagu['judul']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailLaguPage(laguData: lagu),
                      ),
                    );
                  },
                  // Anda dapat menambahkan lebih banyak informasi tentang lagu di sini.
                  // Contoh: Subjudul, gambar not angka, audio, dll.
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
