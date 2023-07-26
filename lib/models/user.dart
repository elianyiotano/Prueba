import 'activity.dart';

class UserData {
  User? user;
  List<Activity>? activities;

  UserData({this.user});

  UserData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['activities'] != null) {
      activities = <Activity>[];
      json['activities'].forEach((v) {
        activities!.add(new Activity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.activities != null) {
      data['activities'] = this.activities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName1;
  String? lastName2;
  String? profilePhotoUrl;
  String? phoneNumber;
  String? email;
  String? category;
  String? referralCode;
  int? points;
  int? targetPoints;

  User(
      {this.id,
      this.firstName,
      this.lastName1,
      this.lastName2,
      this.profilePhotoUrl,
      this.phoneNumber,
      this.email,
      this.category,
      this.referralCode,
      this.points,
      this.targetPoints});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName1 = json['last_name_1'];
    lastName2 = json['last_name_2'];
    profilePhotoUrl = json['profile_photo_url'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    category = json['category'];
    referralCode = json['referral_code'];
    points = json['points'];
    targetPoints = json['target_points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name_1'] = this.lastName1;
    data['last_name_2'] = this.lastName2;
    data['profile_photo_url'] = this.profilePhotoUrl;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['category'] = this.category;
    data['referral_code'] = this.referralCode;
    data['points'] = this.points;
    data['target_points'] = this.targetPoints;
    return data;
  }
}
