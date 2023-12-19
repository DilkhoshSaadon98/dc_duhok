class Message {
  String? senderId;
  String? receiverId;
  String? text;
  List? participants;
  DateTime? timestamp;

  Message(
      {this.senderId,
      this.receiverId,
      this.text,
      this.timestamp,
      this.participants});

  Message.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    text = json['text'];
    participants = json['participants '];
    timestamp = json['timestamp'];
  }
}
