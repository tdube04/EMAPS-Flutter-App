import 'dart:convert';

class Profile {
  int id;
  String name;
  String email;
  int age;
  String gender;
  String nextOfKin;
  int kinNumber;
  String preMessage;



  Profile({this.id = 0, this.name, this.email, this.age, this.gender, this.nextOfKin, this.kinNumber, this.preMessage});

  factory Profile.fromJson(Map<String, dynamic> map) {
    return Profile(
        id: map["id"], name: map["name"], email: map["email"], age: map["age"], gender: map["gender"], nextOfKin: map["nextOfKin"], kinNumber: map["kinNumber"], preMessage: map["preMessage"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "age": age, "gender":gender,"nextOfKin": nextOfKin, "kinNumber":kinNumber,"preMessage":preMessage};
  }

  @override
  String toString() {
    return 'Profile{id: $id, name: $name, email: $email, age: $age, gender: $gender, nextOfKin: $nextOfKin, kinNumber: $kinNumber, preMessage: $preMessage}';
  }

}

List<Profile> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
}

String profileToJson(Profile data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
