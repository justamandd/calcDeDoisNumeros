import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Home(),
    )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController num1Controller = new TextEditingController();
  TextEditingController num2Controller = new TextEditingController();
  String _mensagem = '';

  void limpa(){
    setState(() {
      num1Controller.text = '';
      num2Controller.text = '';
      _mensagem = '';
    });
  }

  String operacao(String sinal){
    String retorno;
    if(sinal == '+'){
      double resultado = double.parse(num1Controller.text) + double.parse(num2Controller.text);
      retorno = resultado.toString();
    }else if(sinal == '-'){
      double resultado = double.parse(num1Controller.text) - double.parse(num2Controller.text);
      retorno = resultado.toString();
    }else if(sinal == '/'){
      double resultado = double.parse(num1Controller.text) / double.parse(num2Controller.text);
      retorno = resultado.toString();
    }else if(sinal == '*'){
      double resultado = double.parse(num1Controller.text) * double.parse(num2Controller.text);
      retorno = resultado.toString();
    }
    return retorno;
  }


  void soma(){
    setState(() {
      _mensagem = operacao('+');
    });
  }

  void subtra(){
    setState(() {
      _mensagem = operacao('-');
    });
  }

  void divisao(){
    setState(() {
      _mensagem = operacao('/');
    });
  }

  void multi(){
    setState(() {
      _mensagem = operacao('*');
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: limpa,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Número 1',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
              controller: num1Controller,
            ),
            Padding(
              padding: EdgeInsets.only(top:20.0, bottom:20),
              child: 
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Número 2',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                  controller: num2Controller,
                ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child:
                  Container(
                    width: 180.0,
                    height: 45,
                    child:
                    RaisedButton(
                      child: Text('+', style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold)),
                      color: Colors.blueGrey,
                      onPressed: soma,
                    )
                  )
                ),
                Container(
                  width: 180.0,
                  height: 45,
                  child:
                  RaisedButton(
                    child: Text('-', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                    color: Colors.blueGrey,
                    onPressed: subtra,
                  )
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top:20.0, bottom:20),
              child:
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child:
                      Container(
                        width: 180.0,
                        height: 45,
                        child:
                        RaisedButton(
                          child: Text('/', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          color: Colors.blueGrey,
                          onPressed: divisao,
                        )
                      )
                    ),
                    Container(
                      width: 180.0,
                      height: 45,
                      child:
                      RaisedButton(
                        child: Text('X', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                        color: Colors.blueGrey,
                        onPressed: multi,
                      )
                    )
                  ],
                )
            ),
            Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
            )
          ]
        ),
      ),
    );
  }
}