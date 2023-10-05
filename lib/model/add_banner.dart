import 'dart:convert';

List<AddBanner> addBannerListFromJson(String val) => List<AddBanner>.from(
    json.decode(val)['data'].map((banner) => AddBanner.fromJson(banner)));

class AddBanner {
  final int id;
  final String image;

  AddBanner({required this.id, required this.image});

  factory AddBanner.fromJson(Map<String, dynamic> data) => AddBanner(
      id: data["id"],
      image: data['attributes']['image']['data']['attributes']['url']);
}
