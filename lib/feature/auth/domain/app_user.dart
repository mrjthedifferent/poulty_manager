import 'dart:convert';

import 'user.dart';

class AppUser {
  User user;
  String? token;
  AppUser({
    required this.user,
    this.token,
  });

  AppUser copyWith({
    User? user,
    String? token,
  }) {
    return AppUser(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'token': token,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AppUser(user: $user, token: $token)';

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.user == user && other.token == token;
  }

  @override
  int get hashCode => user.hashCode ^ token.hashCode;
}
