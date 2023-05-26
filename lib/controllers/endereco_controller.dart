import 'package:busca_cep/model/endereco.dart';
import 'package:busca_cep/repository/endereco_repository.dart';
import 'package:flutter/material.dart';

class EnderecoController {
  final repository = EnderecoRepository();
  Endereco? endereco;
  bool loading = false;

  Future<void> getEndereco(String cep) async {
    try {
      endereco = await repository.getEndereco(cep);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
