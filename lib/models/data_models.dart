class Place {
  int? id;
  String? name;
  String? exactPlace;
  String? price;
  int? stars;
  String? description;
  bool? love;
  String? images;

  Place(
      {this.id,
      this.name,
      this.exactPlace,
      this.price,
      this.stars,
      this.description,
      this.love,
      this.images});

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    exactPlace = json['exact_place'];
    price = json['price'];
    stars = json['stars'];
    description = json['description'];
    love = json['love'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['exact_place'] = exactPlace;
    data['price'] = price;
    data['stars'] = stars;
    data['description'] = description;
    data['love'] = love;
    data['images'] = images;
    return data;
  }
}
