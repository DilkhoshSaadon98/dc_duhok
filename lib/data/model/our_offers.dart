class OurOffers {
  int? offersId;
  String? offersTitle1;
  String? offersTitle1Ar;
  String? offersTitle1Ku;
  String? offersTitle2;
  String? offersTitle2Ar;
  String? offersTitle2Ku;
  String? offersTitle3;
  String? offersTitle3Ar;
  String? offersTitle3Ku;
  String? offersDesc;
  String? offersDescAr;
  String? offersDescKu;
  String? offersImage;

  OurOffers(
      {this.offersId,
      this.offersTitle1,
      this.offersTitle1Ar,
      this.offersTitle1Ku,
      this.offersTitle2,
      this.offersTitle2Ar,
      this.offersTitle2Ku,
      this.offersTitle3,
      this.offersTitle3Ar,
      this.offersTitle3Ku,
      this.offersDesc,
      this.offersDescAr,
      this.offersDescKu,
      this.offersImage});

  OurOffers.fromJson(Map<String, dynamic> json) {
    offersId = json['offers_id'];
    offersTitle1 = json['offers_title1'];
    offersTitle1Ar = json['offers_title1_ar'];
    offersTitle1Ku = json['offers_title1_ku'];
    offersTitle2 = json['offers_title2'];
    offersTitle2Ar = json['offers_title2_ar'];
    offersTitle2Ku = json['offers_title2_ku'];
    offersTitle3 = json['offers_title3'];
    offersTitle3Ar = json['offers_title3_ar'];
    offersTitle3Ku = json['offers_title3_ku'];
    offersDesc = json['offers_desc'];
    offersDescAr = json['offers_desc_ar'];
    offersDescKu = json['offers_desc_ku'];
    offersImage = json['offers_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offers_id'] = this.offersId;
    data['offers_title1'] = this.offersTitle1;
    data['offers_title1_ar'] = this.offersTitle1Ar;
    data['offers_title1_ku'] = this.offersTitle1Ku;
    data['offers_title2'] = this.offersTitle2;
    data['offers_title2_ar'] = this.offersTitle2Ar;
    data['offers_title2_ku'] = this.offersTitle2Ku;
    data['offers_title3'] = this.offersTitle3;
    data['offers_title3_ar'] = this.offersTitle3Ar;
    data['offers_title3_ku'] = this.offersTitle3Ku;
    data['offers_desc'] = this.offersDesc;
    data['offers_desc_ar'] = this.offersDescAr;
    data['offers_desc_ku'] = this.offersDescKu;
    data['offers_image'] = this.offersImage;
    return data;
  }
}