import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:radish_app/constants/data_keys.dart';
import 'package:radish_app/data/item_model.dart';

class ItemService {
  static final ItemService _itemService = ItemService._internal();

  factory ItemService() => _itemService;

  ItemService._internal();

  Future createNewItem(Map<String, dynamic> json, String itemKey) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection(COL_ITEMS).doc(itemKey);
    final DocumentSnapshot documentSnapshot = await documentReference.get();

    if (!documentSnapshot.exists) {
      await documentReference.set(json);
    }
  }

  Future<ItemModel> getItem(String itemKey) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection(COL_ITEMS).doc(itemKey);
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await documentReference.get();
    ItemModel itemModel = ItemModel.fromSnapshot(documentSnapshot);
    return itemModel;
  }
}
