import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lembra_do_remedio/model/remedy_model.dart';
import 'package:lembra_do_remedio/database/suggestion_repository.dart';


class RegistrationRemedy extends StatelessWidget {

  final String id;
  const RegistrationRemedy({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var repository = SuggestionRepository();

    final _idMedicamentoController = TextEditingController();
    final _nomeComercialController = TextEditingController();
    final _atcController = TextEditingController();
    final _medicamentoReferenciaController = TextEditingController();
    final _categoriaRegulatoriaController = TextEditingController();
    final _quantidadeController = TextEditingController();
    final _horarioController = TextEditingController();
    final _diasRecorrentes = TextEditingController();
    final _idNotificacao = TextEditingController();

    _cadastrarMedicamento(RemedyModel remedy) {
      FirebaseFirestore db = FirebaseFirestore.instance;
      db.collection("Medicamentos").doc("firebaseUser.user!.uid").set(remedy.toMap());
    }

    _validarCampos() {
      //Recuperar dados dos campos
      String idMedicamento = _idMedicamentoController.text;
      String nomeComercial = _nomeComercialController.text;
      String atc = _atcController.text;
      String medicamentoReferencia = _medicamentoReferenciaController.text;
      String categoriaRegulatoria = _categoriaRegulatoriaController.text;
      int quantidade = _quantidadeController.value as int;
      int horario = _horarioController.value as int;
      int idNotificacao = _idNotificacao.value as int;

      RemedyModel remedy = RemedyModel(id: '', nomeComercial: '', atc: '',
          medicamentoReferencia: '', categoriaRegulatoria: '', quantidade:0, horario:0, diasRecorrentes: 0, idNotificacao: 0 );
      remedy.id = idMedicamento;
      remedy.nomeComercial = nomeComercial;
      remedy.atc = atc;
      remedy.medicamentoReferencia = medicamentoReferencia;
      remedy.categoriaRegulatoria = categoriaRegulatoria;
      remedy.quantidade = quantidade;
      remedy.horario = horario;
      remedy.diasRecorrentes;
      remedy.idNotificacao;

      _cadastrarMedicamento(remedy);
    }



    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastrar Medicamento"),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("imagens/fundo.png"), fit: BoxFit.cover)),
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: SafeArea(
                  child: FutureBuilder<RemedyModel>(
                      future: repository.fetchResults(id),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data != null) {
                          _nomeComercialController.text =
                              snapshot.data!.nomeComercial;
                          _atcController.text = snapshot.data!.atc;
                          _medicamentoReferenciaController.text =
                              snapshot.data!.medicamentoReferencia;
                          _categoriaRegulatoriaController.text =
                              snapshot.data!.categoriaRegulatoria;
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0),
                              ),
                              TextField(
                                controller: _nomeComercialController,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    labelText: "Nome:",
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        backgroundColor: Colors.white,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 40),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6))),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                              ),
                              TextField(
                                controller: _atcController,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    labelText: "Tipo:",
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        backgroundColor: Colors.white,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 40),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6))),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                              ),
                              TextField(
                                controller: _medicamentoReferenciaController,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    labelText: "Medicamento Referencia:",
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        backgroundColor: Colors.white,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 40),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6))),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                              ),
                              TextField(
                                controller: _categoriaRegulatoriaController,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    labelText: "Categoria:",
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        backgroundColor: Colors.white,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 40),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6))),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                              ),
                              TextField(
                                controller: _quantidadeController,
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    labelText: "Quantidade:",
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        backgroundColor: Colors.white,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 40),
                                    hintText: "Digite a quantidade:",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6))),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                              ),
                              TextField(
                                controller: _horarioController,
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    labelText: "Horario:",
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        backgroundColor: Colors.white,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 40),
                                    hintText: "Digite o horario:",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6))),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16, bottom: 10),
                                child: RaisedButton(
                                    child: Text(
                                      "Cadastrar Medicamento",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    color: Color(0xff1ebbd8),
                                    padding:
                                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                                    onPressed: () {
                                    _validarCampos();
                                    }),
                              ),
                              Padding(
                                padding: EdgeInsets.all(60.0),
                              )
                            ],
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })),
            )));
  }
}
