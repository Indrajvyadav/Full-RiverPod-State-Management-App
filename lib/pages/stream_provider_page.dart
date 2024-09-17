import 'package:flutter/material.dart';
import 'package:riverpod_app/parts/stream_provider_part.dart';

class StreamProviderPage extends StatefulWidget {
  const StreamProviderPage({super.key});

  @override
  State<StreamProviderPage> createState() => _StreamProviderPageState();
}

class _StreamProviderPageState extends State<StreamProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'Stream Provider',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Column(children: [
          StreamProviderPart(),
        ]),
      ),
    );
  }
}
