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
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade200,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              child: Text("MaybePop"),
            ),

            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade200,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).maybePop();
                }
              },
              child: Text("CanPop"),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Eski Adı: WillPopScope 
Yeni Adı: PopScope 

-Eğer kullanıcı telindeki geri butonu ya da appbar da ki geri butonu basarak geri geliyorsa bunu kontrol etmek için kullanılır. 

-Bu yapı Scaffold u sarmalar. PopScope() ile. Biz bu yapıyı kontrol etmek istiyorsan canPop parametresini kullanmak zorundayız.
-canPop false ise geri butonu tıklanamaz hala gelir. Ama hala tıklanma etkileşimini alabiliriz.

- if (didPop) {
          print("didpop true çalıştı");
          Canpop true ise burası çalışır. Burası pop işlemi olduğu zaman çalışır yani ya canpop true olacak ya da aşağıdaki butona tıklandığında pop işlemi varsa çalışır
        } else {
          print("didpop false çalıştı");
          canpop false ise burası çalışır. direk false değeri gönderir. Sayfa pop yapamaz mesela burada daha kayıt tamamlanmadı nereye gidiyorsun diyebiliriz. 
        }

        MaybePop: Butonun bulunduğu sayfa öncesinde başka sayfa yoksa bu kullanılır. Siyah ekran göstermek yerine o sayfada kalır. 



*/
