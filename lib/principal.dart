import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class principal extends StatefulWidget {
  @override
  _principal createState() => _principal();
}

class _principal extends State<principal> {
  int numero = 0;
  var escolha = "";
  var msg = "";
  var vencedor = "";
  String image_win = "assets/imagens/win.png";
  String image_loser = "assets/imagens/loser.png";
  String image_empate = "assets/imagens/empate.png";
  String imagem = "";

  void sortearMaquina() {
    var r = Random();
    var numero = r.nextInt(3);
    if (numero == 0) {
      msg = "pedra";
    } else if (numero == 1) {
      msg = "papel";
    } else {
      msg = "tesoura";
    }
    print(msg);

    setState(() {
      this.msg = msg;
    });
  }

  void quemganhou() {
    if (escolha == msg) {
      vencedor = "empate";
    } else if (escolha == "pedra" && msg == "papel") {
      vencedor = "Loser!";
    } else if (escolha == "pedra" && msg == "tesoura") {
      vencedor = "Win!";
    } else if (escolha == "papel" && msg == "pedra") {
      vencedor = "Win!";
    } else if (escolha == "papel" && msg == "tesoura") {
      vencedor = "Loser!";
    } else if (escolha == "tesoura" && msg == "pedra") {
      vencedor = "Loser!";
    } else if (escolha == "tesoura" && msg == "papel") {
      vencedor = "Win!";
    }

    setState(() {
      this.vencedor = vencedor;
    });
  }

  void imagensqmganhou() {
    if (vencedor == "Win!") {
      imagem = image_win;
    } else if (vencedor == "Loser!") {
      imagem = image_loser;
    } else {
      imagem = image_empate;
    }
    setState(() {
      this.imagem = imagem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          shadowColor: Colors.red,
          title: Text('JokenPô'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Image.asset("assets/imagens/pedra.png"),
                  ),
                  Flexible(
                    flex: 2,
                    child: Image.asset("assets/imagens/papel.png"),
                  ),
                  Flexible(
                    flex: 2,
                    child: Image.asset("assets/imagens/tesoura.png"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 50),
                  Flexible(
                    flex: 2,
                    child: Text(
                      "Pedra",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 100),
                  Flexible(
                    flex: 2,
                    child: Text(
                      "Papel",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 110),
                  Flexible(
                    flex: 2,
                    child: Text(
                      "Tesoura",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Escolher Pedra",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    sortearMaquina();
                    escolha = "pedra";
                    quemganhou();
                    imagensqmganhou();
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Escolher Papel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    sortearMaquina();
                    escolha = "papel";
                    quemganhou();
                    imagensqmganhou();
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Escolher Tesoura",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    sortearMaquina();
                    escolha = "tesoura";
                    quemganhou();
                    imagensqmganhou();
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(height: 10),
              Text(
                "Você escolheu: " + escolha.toString(),
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "A máquina escolheu: " + msg.toString(),
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10),
              Flexible(
                flex: 2,
                child: Center(
                  child: Image.asset(imagem),
                ),
              ),
            ]));
  }
}
