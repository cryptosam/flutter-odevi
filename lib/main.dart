import 'package:flutter/material.dart';
import 'package:flutterodevi/anaSayfa.dart';
import 'package:flutterodevi/sifremiUnuttum.dart';
import 'package:flutterodevi/uyeOl.dart';

void main() {
  runApp(Uygulama());
}

class Uygulama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Giris(),
        '/uyeol': (context) => UyeOl(),
        '/sifremiunuttum': (context) => SifremiUnttum(),
        '/anasayfa': (context) => AnaSayfa()
      },
      initialRoute: '',
    );
  }
}

class Giris extends StatefulWidget {
  @override
  GirisState createState() => GirisState();
}

class GirisState extends State<Giris> {
  String kAdi;
  String sifre;

  var formDeger = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formDeger,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Kullanıcı Adı'),
                  onSaved: (deger) {
                    kAdi = deger;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Şifre'),
                  onSaved: (deger) {
                    sifre = deger;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      child: Text('Şifremi Unuttum'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/sifremiunuttum');
                      },
                    ),
                    MaterialButton(
                      child: Text('Üye Ol'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/uyeol');
                      },
                    ),
                  ],
                ),
                RaisedButton(
                  child: Text('Giriş Yap'),
                  onPressed: () {
                    formDeger.currentState.save();
                    if (kAdi == "demo" && sifre == "demo") {
                      Navigator.pushNamed(context, '/anasayfa');
                    } else {
                      debugPrint("Kullanıcı adı veya şifre hatalı");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
