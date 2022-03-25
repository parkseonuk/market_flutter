import 'package:flutter/cupertino.dart';

CategoryNotifier categoryNotifier = CategoryNotifier();

class CategoryNotifier extends ChangeNotifier {
  String _selectedCategoryInEng = 'none';

  String get currentCategoryInEng => _selectedCategoryInEng;

  String get currentCategoryInKor =>
      categoriesMapEngToKor[_selectedCategoryInEng]!;

  void setNewCategoryWithEng(String newCategory) {
    if(categoriesMapEngToKor.keys.contains(newCategory)) {
      _selectedCategoryInEng = newCategory;
      notifyListeners();
    }
  }

  void setNewCategoryWithKor(String newCategory) {
    if(categoriesMapEngToKor.values.contains(newCategory)) {
      _selectedCategoryInEng = categoriesMapKorToEng[newCategory]!;
      notifyListeners();
    }
  }
}

const Map<String, String> categoriesMapEngToKor = {
  'none': '선택',
  'namecard': '명함',
  'sticker': '스티커',
  'envelope': '봉투',
  'shear': '전단',
  'master': '마스타',
  'photorealistic': '실사출력',
  'digital': '디지털출력'
};

Map<String, String> categoriesMapKorToEng = {
  '선택': 'none',
  '명함': 'namecard',
  '스티커': 'sticker',
  '봉투': 'envelope',
  '전단': 'shear',
  '마스타': 'master',
  '실사출력': 'photorealistic',
  '디지털출력': 'digital'
};
