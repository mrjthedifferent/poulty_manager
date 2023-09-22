import 'dart:convert';

class User {
  String name;
  String? email;
  String phone;
  String? address;
  int role;
  String referCode;
  String? referBy;
  int? unionId;
  String? profession;
  String? about;
  int id;
  String? imageUrl;

  User({
    required this.name,
    this.email,
    required this.phone,
    this.address,
    required this.role,
    required this.referCode,
    this.referBy,
    this.unionId,
    this.profession,
    this.about,
    required this.id,
    this.imageUrl,
  });

  User copyWith({
    String? name,
    String? email,
    String? phone,
    String? address,
    int? role,
    String? referCode,
    String? referBy,
    int? unionId,
    String? profession,
    String? about,
    int? id,
    String? imageUrl,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      role: role ?? this.role,
      referCode: referCode ?? this.referCode,
      referBy: referBy ?? this.referBy,
      unionId: unionId ?? this.unionId,
      profession: profession ?? this.profession,
      about: about ?? this.about,
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() {
    return 'User(name: $name, email: $email, phone: $phone, address: $address, role: $role, referCode: $referCode, referBy: $referBy, unionId: $unionId, profession: $profession, about: $about, id: $id, imageUrl: $imageUrl)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'role': role,
      'referCode': referCode,
      'referBy': referBy,
      'unionId': unionId,
      'profession': profession,
      'about': about,
      'id': id,
      'imageUrl': imageUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] as String,
      address: map['address'] != null ? map['address'] as String : null,
      role: map['role'] as int,
      referCode: map['referCode'] as String,
      referBy: map['referBy'] != null ? map['referBy'] as String : null,
      unionId: map['unionId'] != null ? map['unionId'] as int : null,
      profession:
          map['profession'] != null ? map['profession'] as String : null,
      about: map['about'] != null ? map['about'] as String : null,
      id: map['id'] as int,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
