class Activity {
  int? id;
  String? name;
  String? image;
  String? date;
  String? points;

  Activity(
      {this.id,
      this.name,
      this.image,
      this.date,
      this.points,});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    date = json['date'];
    points = json['points'];;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['date'] = this.date;
    data['points'] = this.points;
    return data;
  }
}
