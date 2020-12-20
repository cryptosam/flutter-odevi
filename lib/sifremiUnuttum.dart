import 'package:flutter/material.dart';

class SifremiUnttum extends StatelessWidget {
  final formDeger = GlobalKey<FormState>();

  String eposta;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formDeger,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                  onSaved: (deger) {
                    eposta = deger;
                  },
                ),
                SizedBox(height: 16),
                RaisedButton(
                  child: Text('Gönder'),
                  onPressed: () {
                    formDeger.currentState.save();
                    debugPrint('Eposta : $eposta');
                    Navigator.pushNamed(context, '/');
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
