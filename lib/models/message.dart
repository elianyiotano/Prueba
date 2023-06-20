class Message {
  int? id;
  String? date;
  String? text;

  Message(
      {this.id,
      this.date,
      this.text});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['text'] = this.text;
    return data;
  }
}
