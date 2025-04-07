import 'package:flutter/material.dart';
import '../widgets/preferencias_chip_selector.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  int _etapaAtual = 0;
  List<String> _preferenciasSelecionadas = [];

  void _atualizarPreferencias(List<String> novasPreferencias) {
    setState(() {
      _preferenciasSelecionadas = novasPreferencias;
    });
  }

  void _continuar() {
    if (_etapaAtual < 1) {
      setState(() => _etapaAtual++);
    }
  }

  void _voltar() {
    if (_etapaAtual > 0) {
      setState(() => _etapaAtual--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Preferências'),
      ),
      body: Stepper(
        currentStep: _etapaAtual,
        onStepContinue: _continuar,
        onStepCancel: _voltar,
        steps: [
          Step(
            title: const Text('Escolha suas preferências'),
            content: PreferenciasChipSelector(
              selecionadas: _preferenciasSelecionadas,
              aoAlterar: _atualizarPreferencias,
            ),
            isActive: _etapaAtual >= 0,
          ),
          Step(
            title: const Text('Resumo'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Preferências selecionadas:'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: _preferenciasSelecionadas
                      .map((item) => Chip(label: Text(item)))
                      .toList(),
                ),
              ],
            ),
            isActive: _etapaAtual >= 1,
          ),
        ],
      ),
    );
  }
}
