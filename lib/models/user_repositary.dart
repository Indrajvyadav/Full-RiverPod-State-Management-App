import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_app/models/new_user_model.dart';

//used for cache(Provider values & if a provider instance is used in multiple places{eg:- Firebase,and others..})
final streamProviderRepo =
    Provider<StreamRepositary>((ref) => StreamRepositary());

class StreamRepositary {
  Stream<int> getStream() {
    return Stream.periodic(
            const Duration(seconds: 3), (computationCount) => computationCount)
        .take(30);
  }
}

final futureProviderRepo = Provider((ref) =>
    FetchUserRepo(/*you can pass dependencies directly inside this provider*/));

class FetchUserRepo {
  Future<User1> fetchUser() async {
    const uri = "https://jsonplaceholder.typicode.com/users/1";
    http.Response res = await http.get(Uri.parse(uri));
    var result = jsonDecode(res.body);
    return User1.fromMap(result);
  }
}
