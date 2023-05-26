import 'package:flutter/material.dart';

class CepBoxWidget extends StatelessWidget {
  const CepBoxWidget({
    required this.cep,
    super.key,
  });

  final String cep;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Row(
        children: cep.characters
            .map(
              (e) => e == '-'
                  ? Container(
                      margin: const EdgeInsets.all(2),
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        e,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                          fontSize: 14,
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.shade800, width: 2),
                      ),
                      margin: const EdgeInsets.all(2),
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        e,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                          fontSize: 14,
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}
