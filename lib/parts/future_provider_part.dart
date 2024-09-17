import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/main.dart';

class FutureProviderPart extends ConsumerWidget {
  const FutureProviderPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(futProvider) is of type AsyncValue better than AsyncSnapshot{FutureBuilder}=
    //not Interconnected
    return ref.watch(futProvider).when(
      data: (data) {
        return Text(data.email);
      },
      error: (error, stackTrace) {
        return Text('$error');
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
