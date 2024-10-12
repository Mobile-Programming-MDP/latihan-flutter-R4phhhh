import 'package:flutter/material.dart';

class GaleriFoto extends StatelessWidget {
  const GaleriFoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galeri Foto"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Image.network(
           "https://picsum.photos/id/88/300/200",
           width: double.infinity,
           fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.only(left:15, right: 15, bottom: 15),
            padding: EdgeInsets.all(20),
            child: const Center(
              child: Text(
                "Jalan di Barcelona",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black12,
                  width: 2,
                ),
              )
            ),
          ),
          const Row(
            children: [
              Icon(
                Icons.place,
                color: Colors.red,
              ),
              Text("Lokasi: Barcelona, Spanyol")
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.calendar_month,
                color: Colors.blue,
              ),
              Text("Publikasi: 13 Agustus 2013")
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
            width: double.infinity,
            child: const Text(
              "Deskripsi",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black12,
                  width: 2,
                ),
              )
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: const Text(
              "Sebuah persimpangan jalan di Barcelona, Spanyol. Foto ini menampilkan berbagai kendaraan yang bergerak dalam arah yang berbeda, menciptakan pemandangan yang sibuk dan energik.",
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      )
    );
  }
}