import 'dart:math';

import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  RedPage({super.key});
  //Eğer stateless widget da buraya bir değişken tanımlıyorsan ya dışarıdan alacaksın ki biz burda istemiyoruz ya da const keywordünü sileceksin
  int _rastgeleSayi = 0;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          print("didpop true çalıştı");
        } else {
          print("didpop false çalıştı");
        }
      },
      child: Scaffold(
        appBar: AppBar(
          //Geri butonunu saklamak isterseniz
          //automaticallyImplyLeading: false,
          title: Text("Kırmızı Sayfa"),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Red Page",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade400,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(),
                ),
                onPressed: () {
                  _rastgeleSayi = Random().nextInt(100);
                  Navigator.of(context).pop(_rastgeleSayi);
                  //Navigator.pop(context);
                },
                child: Text("Ana Sayfaya Geri Dön"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
