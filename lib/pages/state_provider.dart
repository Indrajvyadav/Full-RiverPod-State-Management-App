//StateProvider and notifier(& their properties)
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/main.dart';
import 'package:riverpod_app/pages/state_notifier.dart';

class ThirdPage extends ConsumerWidget {
  const ThirdPage({super.key});

  void onSubmit(String value, WidgetRef ref) {
    ref.read(nameProvider1.notifier).update(
          (state) => value,
        );
    //to access ref we need to mention Widgetref inside function
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider1) ?? '';
    //
    // final name = ref.watch(nameProvider) != null ? ref.watch(nameProvider) : '';
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FourthPage()),
        ),
        child: const Icon(Icons.next_plan_rounded),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'StateProvider',
        ),
      ),
      body: Column(
        children: [
          Center(
            child: TextField(
              onSubmitted: (value) => onSubmit(value, ref),
            ),
          ),
          Center(
            child: Text(name),
          )
        ],
      ),
    );
  }
}
