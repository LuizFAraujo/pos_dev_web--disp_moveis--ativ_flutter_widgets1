import 'package:flutter/material.dart';

class PreferenciasChipSelector extends StatefulWidget {
  final List<String> selecionados;
  final Function(List<String>) onSelecionadosMudaram;

  const PreferenciasChipSelector({
    super.key,
    required this.selecionados,
    required this.onSelecionadosMudaram,
  });

  @override
  State<PreferenciasChipSelector> createState() =>
      _PreferenciasChipSelectorState();
}

class _PreferenciasChipSelectorState extends State<PreferenciasChipSelector> {
  final List<String> _opcoes = [
    'Música',
    'Filmes',
    'Esportes',
    'Tecnologia',
    'Viagens',
    'Leitura',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children:
          _opcoes.map((opcao) {
            final selecionado = widget.selecionados.contains(opcao);
            return ChoiceChip(
              label: Text(opcao),
              selected: selecionado,
              onSelected: (bool value) {
                setState(() {
                  if (value) {
                    widget.selecionados.add(opcao);
                  } else {
                    widget.selecionados.remove(opcao);
                  }
                  widget.onSelecionadosMudaram(widget.selecionados);
                });
              },
            );
          }).toList(),
    );
  }
}
