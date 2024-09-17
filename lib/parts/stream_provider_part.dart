import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/main.dart';
//Main difference between ((1)Provider/StateProvider) & ((2)StateNotifierProvider/ChangeNotifierProvider) & 3StreamProvider :-
//>eg Case : If you have a car & want to change the color.
//1)-> Provider or StateProvider will just update the color value
//2)-> NotifierProviders will rebuild the entire car to produce new color
//3)-> In case of StreamProvider The car will be trashed and new car will be created

//mention Repository here

class StreamProviderPart extends ConsumerWidget {
  const StreamProviderPart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(streamProvider).when(
      data: (data) {
        return Text(data.toString());
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
