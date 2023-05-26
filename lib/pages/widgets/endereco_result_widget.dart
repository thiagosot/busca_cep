import 'package:busca_cep/controllers/endereco_controller.dart';
import 'package:busca_cep/pages/widgets/cep_box_widget.dart';
import 'package:flutter/material.dart';

class EnderecoResultWidget extends StatelessWidget {
  const EnderecoResultWidget({
    super.key,
    required this.enderecoController,
  });

  final EnderecoController enderecoController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.yellow.shade600,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CepBoxWidget(
                cep: enderecoController.endereco?.cep ?? '',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  right: 8,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.mark_as_unread_outlined,
                    color: Colors.blue.shade800,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade800,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(
              16,
            ),
            margin: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (enderecoController.endereco != null && !enderecoController.endereco!.hasError) ...[
                  SelectableText(
                    'Logradouro: ${enderecoController.endereco?.logradouro ?? 'Não informado'}',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.yellow.shade600,
                      fontSize: 18,
                    ),
                  ),
                  SelectableText(
                    'Bairro: ${enderecoController.endereco?.bairro ?? 'Não informado'}',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.yellow.shade600,
                      fontSize: 18,
                    ),
                  ),
                  SelectableText(
                    'Localidade: ${enderecoController.endereco?.localidade ?? 'Não informada'}',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.yellow.shade600,
                      fontSize: 18,
                    ),
                  ),
                  SelectableText(
                    'UF: ${enderecoController.endereco?.uf ?? 'Não informado'}',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.yellow.shade600,
                      fontSize: 18,
                    ),
                  ),
                  SelectableText(
                    'DDD: ${enderecoController.endereco?.ddd ?? 'Não informado'}',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.yellow.shade600,
                      fontSize: 18,
                    ),
                  ),
                ] else
                  Text(
                    'Nenhum endereço localizado para o CEP informado...',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.yellow.shade600,
                      fontSize: 18,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
