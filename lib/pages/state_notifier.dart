import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/main.dart';
import 'package:riverpod_app/pages/change_notifier.dart';

class FourthPage extends ConsumerStatefulWidget {
  const FourthPage({super.key});

  @override
  ConsumerState<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends ConsumerState<FourthPage> {
  void onSubmitName(String value, WidgetRef ref) {
    ref.read(userProvider.notifier).updateName(value);
    //to access ref we need to mention Widgetref inside function
  }

//.toString()-Converts int a = 15->"15"
//int.parse()-Converts String a = "15"->15
  void onSubmitAge(String value, WidgetRef ref) {
    ref.read(userProvider.notifier).updateAge(int.parse(value));
    //to access ref we need to mention Widgetref inside function
  }

  @override
  Widget build(BuildContext context) {
    // final user = ref.watch(userProvider) as User;
    // we cant do explicit conversion cuz if we do that we need to do that everywhere in the project
    // so we need to change in main.dart
    //
    final user = ref.watch(userProvider);
    // rebuilds entire build function

    // final userSelect =ref.watch(userProvider.select((value) => value.name));
    // used to rebuild the entire build func when only certain property of class user class changes
    //
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FifthPage(),
              ));
        },
        child: const Icon(Icons.next_plan_rounded),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade200,
        title: const Center(
          child: Text('State_Notifier'),
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
