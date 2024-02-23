import 'dart:convert';

import 'package:flutter/widgets.dart';

class User {
  int? code;
  bool? status;
  Data? data;
  User({
    this.code,
    this.status,
    this.data,
  });

  User copyWith({
    ValueGetter<int?>? code,
    ValueGetter<bool?>? status,
    ValueGetter<Data?>? data,
  }) {
    return User(
      code: code != null ? code() : this.code,
      status: status != null ? status() : this.status,
      data: data != null ? data() : this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'status': status,
      'data': data?.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      code: map['code']?.toInt(),
      status: map['status'],
      data: map['data'] != null ? Data.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(code: $code, status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.code == code &&
        other.status == status &&
        other.data == data;
  }

  @override
  int get hashCode => code.hashCode ^ status.hashCode ^ data.hashCode;
}

class Data {
  String? token;
  User? user;
  Data({
    this.token,
    this.user,
  });

  Data copyWith({
    ValueGetter<String?>? token,
    ValueGetter<User?>? user,
  }) {
    return Data(
      token: token != null ? token() : this.token,
      user: user != null ? user() : this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'user': user?.toMap(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      token: map['token'],
      user: map['user'] != null ? User.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() => 'Data(token: $token, user: $user)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data && other.token == token && other.user == user;
  }

  @override
  int get hashCode => token.hashCode ^ user.hashCode;
}
