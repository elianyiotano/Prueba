class Event {
  int? id;
  String? name;
  String? image;
  List<String>? images;
  String? date;
  String? place;
  String? description;

  Event(
      {this.id,
      this.name,
      this.image,
      this.images,
      this.date,
      this.place,
      this.description});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    images = List<String>.from(json['images']);
    date = json['date'];
    place = json['place'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['images'] = this.images;
    data['date'] = this.date;
    data['place'] = this.place;
    data['description'] = this.description;
    return data;
  }
}
