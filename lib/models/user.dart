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
  String? email;
  String? category;
  String? username;
  String? uid;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? events;
  String? points;
  String? phoneNumber;
  bool? isConfirmed;
  bool? isActive;
  String? photo;
  String? lastConnection;

  User(
      {this.id,
      this.email,
      this.category,
      this.username,
      this.uid,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.events,
      this.points,
      this.phoneNumber,
      this.isConfirmed,
      this.isActive,
      this.photo,
      this.lastConnection});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    category = json['category'];
    username = json['username'];
    uid = json['uid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    events = json['events'];
    points = json['points'];
    phoneNumber = json['phone_number'];
    isConfirmed = json['is_confirmed'];
    isActive = json['is_active'];
    photo = json['photo'];
    lastConnection = json['last_connection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['category'] = this.category;
    data['username'] = this.username;
    data['uid'] = this.uid;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['events'] = this.events;
    data['points'] = this.points;
    data['phone_number'] = this.phoneNumber;
    data['is_confirmed'] = this.isConfirmed;
    data['is_active'] = this.isActive;
    data['photo'] = this.photo;
    data['last_connection'] = this.lastConnection;
    return data;
  }
}
