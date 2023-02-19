import 'dart:ffi';

class ImgFile {
  String userID;
  List<String> allergens;
  Bool hasAllergens;
  String image;

  ImgFile({
    required this.userID,
    required this.allergens,
    required this.hasAllergens,
    required this.image,
  });

  factory ImgFile.fromJson(Map<String, dynamic> json) {
    return ImgFile(
      userID: json['userID'],
      allergens: json['allergens'],
      hasAllergens: json['hasAllergens'],
      image: json['image'],
    );
  }
}
