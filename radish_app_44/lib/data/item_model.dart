import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class ItemModel {
  late String itemKey;
  late String userKey;
  late List<String> imageDownladUrls;
  late String title;
  late String category;
  late num price;
  late bool negotiable;
  late String detail;
  late String address;
  late GeoFirePoint geoFirePoint;
  late DateTime createdDate;
  late DocumentReference? reference;

  ItemModel(
      {required this.itemKey,
      required this.userKey,
      required this.imageDownladUrls,
      required this.title,
      required this.category,
      required this.price,
      required this.negotiable,
      required this.detail,
      required this.address,
      required this.geoFirePoint,
      required this.createdDate,
      this.reference});

  ItemModel.fromJson(Map<String, dynamic> json, this.itemKey, this.reference) {
    userKey = json['userKey'] ?? "";
    imageDownladUrls = json['imageDownladUrls'] != null
        ? json['imageDownladUrls'].cast<String>()
        : [];
    title = json['title'] ?? "";
    category = json['category'] ?? "none";
    price = json['price'] ?? 0;
    negotiable = json['negotiable'] ?? false;
    detail = json['detail'] ?? "";
    address = json['address'] ?? "";
    geoFirePoint = GeoFirePoint((json['geoFirePoint']['geopoint']).latitude,
        (json['geoFirePoint']['geopoint']).longitude);
    createdDate = json['createdDate'] == null
        ? DateTime.now().toUtc()
        : (json['createdDate'] as Timestamp).toDate();
  }

  ItemModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data()!, snapshot.id, snapshot.reference);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userKey'] = userKey;
    map['imageDownladUrls'] = imageDownladUrls;
    map['title'] = title;
    map['category'] = category;
    map['price'] = price;
    map['negotiable'] = negotiable;
    map['detail'] = detail;
    map['address'] = address;
    map['geoFirePoint'] = geoFirePoint;
    map['createdDate'] = createdDate;
    return map;
  }

  //아이템키 생성
  static String generateItemKey(String uid) {
    String timeInMilli = DateTime.now().microsecondsSinceEpoch.toString();
    return '${uid}_$timeInMilli';
  }
}
