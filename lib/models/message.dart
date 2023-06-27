class Message {
  int? id;
  String? date;
  String? title;
  String? text;

  Message(
      {this.id,
      this.date,
      this.title,
      this.text});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    title = json['title'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['title'] = this.title;
    data['text'] = this.text;
    return data;
  }
}
