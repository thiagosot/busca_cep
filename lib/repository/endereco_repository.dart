import 'package:busca_cep/model/endereco.dart';
import 'package:dio/dio.dart';

class EnderecoRepository {
  final repository = Dio();

  Future<Endereco?> getEndereco(String cep) async {
    try {
      final resposta = await repository.get('https://viacep.com.br/ws/$cep/json/');
      if (resposta.data != null) {
        return Endereco.fromJson(resposta.data);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
