import 'package:flutter/material.dart';

class PreferenciasChipSelector extends StatefulWidget {
  final List<String> selecionadas;
  final Function(List<String>) aoAlterar;

  const PreferenciasChipSelector({
    super.key,
    required this.selecionadas,
    required this.aoAlterar,
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
      children: _opcoes.map((opcao) {
        final bool selecionado = widget.selecionadas.contains(opcao);

        return ChoiceChip(
          label: Text(opcao),
          selected: selecionado,
          onSelected: (bool marcado) {
            setState(() {
              if (marcado) {
                widget.selecionadas.add(opcao);
              } else {
                widget.selecionadas.remove(opcao);
              }
              widget.aoAlterar(widget.selecionadas);
            });
          },
        );
      }).toList(),
    );
  }
}
