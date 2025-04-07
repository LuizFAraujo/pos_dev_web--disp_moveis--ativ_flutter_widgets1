import 'package:flutter/material.dart';

import 'preferencias_chip_selector.dart';
import 'resumo_widget.dart';

class StepperCustom extends StatefulWidget {
  const StepperCustom({super.key});

  @override
  State<StepperCustom> createState() => _StepperCustomState();
}

class _StepperCustomState extends State<StepperCustom> {
  int _currentStep = 0;
  List<String> _selecionados = [];

  void _avancar() {
    if (_currentStep < 2) {
      setState(() => _currentStep++);
    } else {
      _mostrarDialogoFinal();
    }
  }

  void _voltar() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  void _mostrarDialogoFinal() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Preferências salvas!'),
            content: const Text('Suas escolhas foram registradas com sucesso.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text('Voltar ao Início'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.vertical,
      currentStep: _currentStep,
      onStepContinue: _avancar,
      onStepCancel: _voltar,
      controlsBuilder: (context, details) {
        return Row(
          children: [
            if (_currentStep > 0)
              ElevatedButton(
                onPressed: details.onStepCancel,
                child: const Text('Voltar'),
              ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: details.onStepContinue,
              child: Text(_currentStep < 2 ? 'Próximo' : 'Finalizar'),
            ),
          ],
        );
      },
      steps: [
        Step(
          title: const Text('Introdução'),
          content: const Text(
            'Vamos entender melhor seus gostos. Nas próximas etapas, você poderá selecionar suas preferências.',
          ),
          isActive: _currentStep == 0,
        ),
        Step(
          title: const Text('Escolha suas preferências'),
          content: PreferenciasChipSelector(
            selecionados: _selecionados,
            onSelecionadosMudaram: (novos) {
              setState(() {
                _selecionados = novos;
              });
            },
          ),
          isActive: _currentStep == 1,
        ),
        Step(
          title: const Text('Resumo'),
          content: ResumoWidget(selecionados: _selecionados),
          isActive: _currentStep == 2,
        ),
      ],
    );
  }
}
