import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lembra_do_remedio/model/AgendarRemedio.dart';

class agendamento extends StatefulWidget {
  @override
  _agendamentoState createState() => _agendamentoState();
}

class _agendamentoState extends State<agendamento> {
  TextEditingController _controllerNome = TextEditingController(text: "");
  TextEditingController _controllerQuantidade = TextEditingController(text: "");
  TextEditingController _controllermodo = TextEditingController(text: "");
  TextEditingController _controllerfrequencia = TextEditingController(text: "");
  String _mensagemErro = "";

  _validarCampos() {
    //Recuperar dados dos campos
    String nome = _controllerNome.text;
    String quantidade = _controllerQuantidade.text;
    String modo = _controllermodo.text;
    String frequencia = _controllerfrequencia.text;

    //validar campos
    if (nome.isNotEmpty) {
      if (quantidade.isNotEmpty) {
        if (modo.isNotEmpty) {
          if (frequencia.isNotEmpty) {
            Agenda agenda = Agenda();
            agenda.nome_remedio = nome;
            agenda.quantidade = quantidade;
            agenda.mode_de_uso = modo;
            agenda.frequencia = frequencia;

            _cadastrarAgenda(agenda);
          } else {
            setState(() {
              _mensagemErro = "Preencha a frequência!";
            });
          }
        } else {
          setState(() {
            _mensagemErro = "Preencha o Modo de uso!";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Preencha a Quantidade!";
        });
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o Nome do Remédio!";
      });
    }
  }

  _cadastrarAgenda(Agenda agenda) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("agenda").doc("firebaseUser.user!.uid").set(agenda.toMap());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agendamento "),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: TextField(
                    controller: _controllerNome,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Nome do Remedio",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: TextField(
                    controller: _controllerQuantidade,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Quantidade",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: TextField(
                    controller: _controllermodo,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Mode de Uso",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: TextField(
                    controller: _controllerfrequencia,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Frequencia",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Color(0xff1ebbd8),
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      onPressed: () {
                        _validarCampos();
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      _mensagemErro,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
