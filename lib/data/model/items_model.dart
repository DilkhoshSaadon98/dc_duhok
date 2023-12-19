class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsNameKu;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsDescKu;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  int? itemsCat;
  String? itemsDate;
  int? catagoriesId;
  String? catagoriesName;
  String? catagoriesNameAr;
  String? catagoriesNameKu;
  String? catagoriesImage;
  String? catagoriesDatetime;
  int? favorite;
  int? itemsPricedisount;

  ItemsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsNameKu,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsDescKu,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsCat,
      this.itemsDate,
      this.catagoriesId,
      this.catagoriesName,
      this.catagoriesNameAr,
      this.catagoriesNameKu,
      this.catagoriesImage,
      this.catagoriesDatetime,
      this.favorite,
      this.itemsPricedisount});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsNameKu = json['items_name_ku'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsDescKu = json['items_desc_ku'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsCat = json['items_cat'];
    itemsDate = json['items_date'];
    catagoriesId = json['catagories_id'];
    catagoriesName = json['catagories_name'];
    catagoriesNameAr = json['catagories_name_ar'];
    catagoriesNameKu = json['catagories_name_ku'];
    catagoriesImage = json['catagories_image'];
    catagoriesDatetime = json['catagories_datetime'];
    favorite = json['favorite'];
    itemsPricedisount = json['items_pricedisount'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['items_id'] = this.itemsId;
  //   data['items_name'] = this.itemsName;
  //   data['items_name_ar'] = this.itemsNameAr;
  //   data['items_desc'] = this.itemsDesc;
  //   data['items_desc_ar'] = this.itemsDescAr;
  //   data['items_image'] = this.itemsImage;
  //   data['items_count'] = this.itemsCount;
  //   data['items_active'] = this.itemsActive;
  //   data['items_price'] = this.itemsPrice;
  //   data['items_discount'] = this.itemsDiscount;
  //   data['items_cat'] = this.itemsCat;
  //   data['items_date'] = this.itemsDate;
  //   data['catagories_id'] = this.catagoriesId;
  //   data['catagories_name'] = this.catagoriesName;
  //   data['catagories_name_ar'] = this.catagoriesNameAr;
  //   data['catagories_image'] = this.catagoriesImage;
  //   data['catagories_datetime'] = this.catagoriesDatetime;
  //   data['favorite'] = this.favorite;
  //   data['items_pricedisount'] = this.itemsPricedisount;
  //   return data;
  // }
}