class NotificationModel {
  int? notificationId;
  String? notificationTitle;
  String? notificationTitleAr;
  String? notificationTitleKu;
  String? notificationBody;
  String? notificationBodyAr;
  String? notificationBodyKu;
  int? notificationIsread;
  int? notificationUserid;
  String? notificationDatetime;

  NotificationModel(
      {this.notificationId,
      this.notificationTitle,
      this.notificationBody,
      this.notificationBodyAr,
      this.notificationBodyKu,
      this.notificationTitleAr,
      this.notificationTitleKu,
      this.notificationIsread,
      this.notificationUserid,
      this.notificationDatetime});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notificationTitleAr = json['notification_title_ar'];
    notificationTitleKu = json['notification_title_ku'];
    notificationBody = json['notification_body'];
    notificationBodyAr = json['notification_body_ar'];
    notificationBodyKu = json['notification_body_ku'];
    notificationIsread = json['notification_isread'];
    notificationUserid = json['notification_userid'];
    notificationDatetime = json['notification_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notification_id'] = notificationId;
    data['notification_title'] = notificationTitle;
    data['notification_body'] = notificationBody;
    data['notification_isread'] = notificationIsread;
    data['notification_userid'] = notificationUserid;
    data['notification_datetime'] = notificationDatetime;
    return data;
  }
}
