import 'package:flutter/material.dart';

class ResumoWidget extends StatelessWidget {
  final List<String> selecionados;

  const ResumoWidget({super.key, required this.selecionados});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tudo pronto!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Este é o resumo das suas preferências:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Usuário',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text('Perfil ativo', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Preferências escolhidas:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              selecionados
                  .map(
                    (e) => Chip(
                      label: Text(e),
                      backgroundColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}
