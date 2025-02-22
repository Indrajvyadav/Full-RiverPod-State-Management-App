// ignore_for_file: public_member_api_docs, sort_constructors_first
//StateNotifier and its concepts
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
//class models in dart is immutable
class User {
  final String name;
  final int age;
  const User({
    required this.name,
    required this.age,
  });

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, age: $age)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

class UserNotifier extends StateNotifier<User> {
  //StateNotifier<aaa>  aaa= datatype's state that need to be changed
  UserNotifier(super.state);
  //state=state of datatype in <aaa>
  void updateName(String n) {
    // state = User(name: n, age: state.age);
    //👆 in-Efficient for more complex class/model

    state = state.copyWith(name: n);
  }

  void updateAge(int a) {
    state = state.copyWith(age: a);
  }
}

class UserNotifierChange extends ChangeNotifier {
  //Here this ChangNotifier class whis is inherited is not from riverpod package but flutter/material.dart package
  User _user = const User(name: '', age: 0);

  void updateName(String n) {
    // _user use private to avoid bugs in future
    _user = _user.copyWith(name: n);
    notifyListeners(); //we need to notify listeners like read/watch/select for changes
  }

  void updateAge(int a) {
    _user = _user.copyWith(age: a);
    notifyListeners();
  }
}
