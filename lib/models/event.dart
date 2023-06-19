class Event {
  int? id;
  String? name;
  String? image;
  String? date;
  String? place;
  String? description;

  Event(
      {this.id,
      this.name,
      this.image,
      this.date,
      this.place,
      this.description});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    date = json['date'];
    place = json['place'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['date'] = this.date;
    data['place'] = this.place;
    data['description'] = this.description;
    return data;
  }
}
