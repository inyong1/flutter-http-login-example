import 'dart:convert';

class User {
  final int id;
  final String name;
  final String email;
  final String bank;
  final String divisi;
  final String jabatan;
  final String contact;
  final String pict;
  final String role;
  final String token;

  User({
    this.id = 0,
    this.name = "",
    this.email = "",
    this.bank = "",
    this.divisi = "",
    this.jabatan = "",
    this.contact = "",
    this.pict = "",
    this.role = "",
    this.token = "",
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        bank: json['bank'] ?? '',
        divisi: json['divisi'] ?? '',
        jabatan: json['jabatan'] ?? '',
        contact: json['contact'] ?? '',
        pict: json['pict'] ?? '',
        role: json['role'] ?? '',
        token: json['token'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'email': this.email,
        'bank': this.bank,
        'divisi': this.divisi,
        'jabatan': this.jabatan,
        'contact': this.contact,
        'pict': this.pict,
        'role': this.role,
        'token': this.token,
      };

  @override
  String toString() {
    return json.encode(toJson());
  }
}
