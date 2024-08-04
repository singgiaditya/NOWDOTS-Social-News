import 'dart:convert';

class CreateAccountRequestModel {
    final String? name;
    final String? email;
    final DateTime? dob;

    CreateAccountRequestModel({
        this.name,
        this.email,
        this.dob,
    });

    factory CreateAccountRequestModel.fromRawJson(String str) => CreateAccountRequestModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateAccountRequestModel.fromJson(Map<String, dynamic> json) => CreateAccountRequestModel(
        name: json["name"],
        email: json["email"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "dob": dob?.toIso8601String(),
    };
}
