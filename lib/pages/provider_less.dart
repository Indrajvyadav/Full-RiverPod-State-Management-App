//Provider,Stateless,Consumer and ConsumerWidget
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/main.dart';

import 'provider_ful.dart';

// you can use consumer widget
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

// , WidgetRef ref
//final name = ref.read(nameProvider); = it reads only one time (used in statefull widget)

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);

    //here watch and read are 2 diff methods to listen

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondPage(),
              ));
        },
        child: const Icon(
          Icons.next_plan_rounded,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Center(
          child: Text('Named Provider'),
        ),
      ),
      body:
          //in case of using stateless or Statefull widgets
          //  Consumer(
          //   builder: (context, ref, child) {
          //     final name = ref.watch(nameProvider);
          //     return

          Column(
        children: [
          Center(
            child: Text(name),
          )
        ],
      ),
    );
  }
}
