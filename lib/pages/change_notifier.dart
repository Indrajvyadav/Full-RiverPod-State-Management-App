import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/main.dart';
import 'package:riverpod_app/pages/future_provider_page.dart';

class FifthPage extends ConsumerStatefulWidget {
  const FifthPage({super.key});

  @override
  ConsumerState<FifthPage> createState() => _FourthPageState();
}

class _FourthPageState extends ConsumerState<FifthPage> {
  void onSubmitName(String value, WidgetRef ref) {
    ref.read(changeProvider).updateName(value);
    //No need to use notifiers here cuz we already called notifyListeners() function in model.dart
  }

  void onSubmitAge(String value, WidgetRef ref) {
    ref.read(changeProvider).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(changeProvider).user;
    //We need to add user here cuz to convert it from UserNotifierChange to user
    //
    //Reason not use ChangeNotifierProvider cuz it is a provider which is muttable unlike others
    //final user = ref.watch(changeProvider).user = const User(name: 'arun', age: 8);👈

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FutureProviderPage(),
              ));
        },
        child: const Icon(Icons.next_plan_rounded),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade200,
        title: const Center(
          child: Text('Change Notifier'),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: TextField(
              onSubmitted: (value) => onSubmitName(value, ref),
            ),
          ),
          Center(
              child: TextField(
            onSubmitted: (value) => onSubmitAge(value, ref),
          )),
          Center(
            child: Text(user.name),
            //you cant access user.class-variables without explicit user (object->user) conversion
          ),
          Center(
            child: Text(user.age.toString()),
            //you cant access user.class-variables without explicit user (object->user) conversion
          )
        ],
      ),
    );
  }
}
