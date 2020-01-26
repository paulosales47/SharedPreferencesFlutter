import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _valorInformado = "Nada salvo!";

  _salvar(){}
  _ler(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(_valorInformado),
            ),
            TextField(
              keyboardType: TextInputType.text,
              style: TextStyle(
                fontSize: 15
              ),
              decoration: InputDecoration(
                labelText: "Infomre um valor",
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16, right: 16),
                  child: RaisedButton(
                    color: Colors.lightGreen,
                    textColor: Colors.white,
                    onPressed: _salvar,
                    child: Text("Salvar",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: RaisedButton(
                    color: Colors.lightGreen,
                    textColor: Colors.white,
                    onPressed: _ler,
                    child: Text("Ler",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}
