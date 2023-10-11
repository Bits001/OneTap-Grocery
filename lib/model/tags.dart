// ignore_for_file: public_member_api_docs, sort_constructors_first

class Tags {
  final int id;
  final String title;
  final double price;

  Tags({
    required this.id,
    required this.title,
    required this.price,
  });

  factory Tags.fromJson(Map<String, dynamic> data) => Tags(
      id: data['id'],
      title: data['attributes']['title'],
      price: data['attributes']['price'].toDouble());
}
