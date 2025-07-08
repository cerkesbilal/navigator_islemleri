import 'package:flutter/material.dart';
import 'package:navigator_islemleri/red_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigatorKullanimi(),
    );
  }
}

class NavigatorKullanimi extends StatefulWidget {
  const NavigatorKullanimi({super.key});

  @override
  State<NavigatorKullanimi> createState() => _NavigatorKullanimiState();
}

class _NavigatorKullanimiState extends State<NavigatorKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator İşlemleri"),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              onPressed: () async {
                //1.durum daha okunaklı
                int? gelenSayi = await Navigator.of(
                  context,
                ).push<int>(MaterialPageRoute(builder: (context) => RedPage()));

                print(gelenSayi);
              },
              child: Text("Kırmızı Sayfaya Git"),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade200,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              onPressed: () {},
              child: Text("Sonraki buton"),
            ),
          ],
        ),
      ),
    );
  }
}
