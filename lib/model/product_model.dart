// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final int pid;
  final String imgUrl;
  final String title;
  final double price;
  final String shortDescription;
  final String longDescription;
  final int review;
  final double rating;
  bool isSelected;
  int quantity;
  ProductModel({
    required this.pid,
    required this.imgUrl,
    required this.title,
    required this.price,
    required this.shortDescription,
    required this.longDescription,
    required this.review,
    required this.rating,
    this.isSelected = false,
    this.quantity = 1,
  });
}
