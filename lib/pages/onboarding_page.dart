import 'package:flutter/material.dart';

import '../theme_controller.dart';
import '../widgets/stepper_custom.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferências'),
        actions: [
          IconButton(
            tooltip: 'Alternar tema',
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: ThemeController.toggleTheme,
          ),
        ],
      ),
      body: const SafeArea(child: StepperCustom()),
    );
  }
}
