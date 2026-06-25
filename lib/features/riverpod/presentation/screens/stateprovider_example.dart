import 'package:flutter/material.dart';
import 'package:flutter_learning_lab/features/riverpod/presentation/providers/state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final check = ref.watch(isIncreProvider);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                check
                    ? ref.read(counterProvider.notifier).state++
                    : ref.read(counterProvider.notifier).state--;
              },
              icon: Icon(check ? Icons.add : Icons.remove),
            ),
            Text('$count'),
            Checkbox(
              value: check,
              onChanged: (newValue) {
                ref.read(isIncreProvider.notifier).state = !check;
              },
            ),
          ],
        ),
      ),
    );
  }
}
