class Coupon {
  int? id;
  String? name;
  String? description;
  String? image;
  String? validFrom;
  String? validUntil;
  String? venue;
  String? createdAt;
  String? updatedAt;

  Coupon(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.validFrom,
      this.validUntil,
      this.venue,
      this.createdAt,
      this.updatedAt});

  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    validFrom = json['valid_from'];
    validUntil = json['valid_until'];
    venue = json['venue'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['valid_from'] = this.validFrom;
    data['valid_until'] = this.validUntil;
    data['venue'] = this.venue;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    
    return data;
  }
}
