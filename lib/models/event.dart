class Event {
  int? id;
  String? name;
  String? description;
  String? image;
  String? date;
  String? venue;
  String? createdAt;
  String? updatedAt;

  Event(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.date,
      this.venue,
      this.createdAt,
      this.updatedAt});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image_url'];
    date = json['date'];
    venue = json['venue'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image_url'] = this.image;
    data['date'] = this.date;
    data['venue'] = this.venue;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    
    return data;
  }
}
