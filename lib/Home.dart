import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _valorInformado = "Nada salvo!";
  var _controller = TextEditingController();

  _salvar() async{
    final preferencias = await SharedPreferences.getInstance();
    await preferencias.setString("valorInformado", _controller.text);
    setState(() {
      _valorInformado = _controller.text;
    });

  }
  _ler() async{
    final preferencias = await SharedPreferences.getInstance();
    setState(() {
      _valorInformado = preferencias.getString("valorInformado") ?? "Nada salvo!";
    });
  }
  _remover() async{
    final preferencias = await SharedPreferences.getInstance();
    preferencias.remove("valorInformado");
    setState(() {
      _valorInformado = "Nada salvo!";
    });
  }

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
              controller: _controller,
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
                  padding: EdgeInsets.only(top: 16, right: 16),
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
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: RaisedButton(
                    color: Colors.lightGreen,
                    textColor: Colors.white,
                    onPressed: _remover,
                    child: Text("Remover",
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
