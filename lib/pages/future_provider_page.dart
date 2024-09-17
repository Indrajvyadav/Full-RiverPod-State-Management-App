import 'package:flutter/material.dart';
import 'package:riverpod_app/pages/stream_provider_page.dart';
import 'package:riverpod_app/parts/future_provider_part.dart';

class FutureProviderPage extends StatelessWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StreamProviderPage(),
              ));
        },
        child: const Icon(Icons.next_plan_rounded),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'Future Provider',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Column(
          children: [FutureProviderPart()],
        ),
      ),
    );
  }
}
