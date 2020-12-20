import 'package:flutter/material.dart';

class UyeOl extends StatelessWidget {
  final formDeger = GlobalKey<FormState>();

  String eposta;
  String kAdi;
  String sifre;
  String tekrarSifre;

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
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  onSaved: (deger) {
                    eposta = deger;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Kullanıcı Adı',
                  ),
                  onSaved: (deger) {
                    kAdi = deger;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Şifre',
                  ),
                  onSaved: (deger) {
                    sifre = deger;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Şifre Tekrar',
                  ),
                  onSaved: (deger) {
                    tekrarSifre = deger;
                  },
                ),
                SizedBox(height: 16),
                RaisedButton(
                  child: Text('Vazgeç'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                SizedBox(height: 16),
                RaisedButton(
                  child: Text('Kaydol'),
                  onPressed: () {
                    formDeger.currentState.save();
                    debugPrint(
                        'Eposta: $eposta, Şifre: $sifre, Tekrar Şifre: $tekrarSifre');
                    if (tekrarSifre == sifre) {
                      Navigator.pushNamed(context, '/');
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
