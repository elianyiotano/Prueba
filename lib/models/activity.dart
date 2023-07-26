class Activity {
  String? name;
  String? image;
  String? date;
  int? points;

  Activity(
      {this.name,
      this.image,
      this.date,
      this.points,});

  Activity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image_url'];
    date = json['date'];
    points = json['points'];;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image_url'] = this.image;
    data['date'] = this.date;
    data['points'] = this.points;
    return data;
  }
}
