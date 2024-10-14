
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/models/user_model.dart';
import 'package:riverpod_app/models/user_repositary.dart';

import 'pages/provider_less.dart';

//
//Provider-single change
//
final nameProvider = Provider<String>((ref) => 'Indraj V Yadav');
//
//StateProvider-change state of small valued provider(bool,int,double,String, etc..)
//
final nameProvider1 = StateProvider<String?>((ref) => null);
//
//StateNotifierProvider-Used to change values of models,class variables
//

//Here UserNotifier=Class we are returning
//& User= state of this👆 class
final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(const User(name: '', age: 0)),
);

//ChangeNotifier-Similar to StateNotifier(better to use StateNotifier)
//not recommend using it cuz of mutability issue
final changeProvider = ChangeNotifierProvider(
  (ref) => UserNotifierChange(),
);

//

//FutureProvider

final futProvider = FutureProvider((ref) {
  //if we are using repo

  final fetchuserRep = ref.watch(futureProviderRepo);
  return fetchuserRep.fetchUser();
});
//         const uri = "https://jsonplaceholder.typicode.com/users/1";
// return http.get(Uri.parse(uri)).then(
//       (value) => User1.fromJson(value.body),
//     );

//        http.Response res = await http.get(Uri.parse(uri));
//        var result = jsonDecode(res.body);
//jsonDecode = parses String-> dynamic
//jsonEncode = parses -> String
//here res is nothing but http response(.body) "get" Strings
//         return User1.fromMap(result);
//In fromMap , you retrieve the title and completed from some map, and save it in your local variables.
// In the toMap you take the saved values in your local variables and can return a Map.
//The fromJson method is used to create a Dart object from a JSON data structure (typically a Map).
//The toJson method is used to convert a Dart object into a JSON data structure, typically a Map.
//});

//
final streamProvider = StreamProvider((ref) {
  final streamchuserRep = ref.watch(streamProviderRepo);
  return streamchuserRep.getStream();
});
//
//
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
