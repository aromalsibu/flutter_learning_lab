import 'package:flutter/material.dart';
import 'package:flutter_learning_lab/features/riverpod/presentation/providers/simple_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderTest extends ConsumerWidget {
  const ProviderTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exce = ref.read(execProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                exce.start();
              },
              icon: Icon(Icons.play_arrow),
            ),
            IconButton(
              onPressed: () {
                exce.end();
              },
              icon: Icon(Icons.stop),
            ),
          ],
        ),
      ),
    );
  }
}
