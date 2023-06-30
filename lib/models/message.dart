class Message {
  int? id;
  String? content;
  String? timestamp;
  String? category;
  String? status;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Message(
      {this.id,
      this.content,
      this.timestamp,
      this.category,
      this.status,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    timestamp = json['timestamp'];
    category = json['category'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['timestamp'] = this.timestamp;
    data['category'] = this.category;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
