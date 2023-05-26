import 'package:busca_cep/controllers/endereco_controller.dart';
import 'package:busca_cep/pages/widgets/endereco_result_widget.dart';
import 'package:busca_cep/pages/widgets/loading_indicator.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late EnderecoController controller;
  late MaskedTextController textController;

  @override
  void initState() {
    super.initState();
    controller = EnderecoController();
    textController = MaskedTextController(mask: '00000-000');
    textController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Busca CEP',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade600,
          toolbarHeight: size.height * 0.10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          title: Text(
            'Busca CEP',
            style: TextStyle(
              color: Colors.blue.shade800,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Colors.blue.shade800,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Colors.blue.shade800,
                        ),
                      ),
                      hintText: 'CEP',
                      labelText: 'Insira um CEP a ser buscado...',
                      suffixIcon: IconButton(
                        tooltip: 'Buscar',
                        onPressed: textController.unmasked.length == 8
                            ? () async {
                                setState(() {
                                  controller.loading = true;
                                });
                                await controller.getEndereco(textController.unmasked);
                                setState(() {
                                  controller.loading = false;
                                });
                              }
                            : null,
                        icon: Icon(
                          Icons.search,
                          color: textController.unmasked.length == 8 ? null : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  if (controller.endereco != null) ...[
                    const SizedBox(
                      height: 32,
                    ),
                    EnderecoResultWidget(enderecoController: controller),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          controller.endereco = null;
                          textController.clear();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade800,
                      ),
                      child: Text(
                        'Limpar busca',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.yellow.shade600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (controller.loading) const LoadingIndicator(),
          ],
        ),
      ),
    );
  }
}
