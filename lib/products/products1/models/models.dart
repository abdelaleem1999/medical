class HomeModels {
  HomeModels({
    this.price,
    this.offers,
    this.id,
    this.image,
    this.name,
    this.descraption,
  });
 int? id;
  int? price;
  String? offers;
  String? image;
  String? name;
  String? descraption;

  HomeModels.fromJson(Map<dynamic, dynamic> json) {
    price = json["price"] ?? 0;
    offers = json["offers"] ?? "";
    id = json["id"] ?? "";
    image = json["image"] ?? "";
    name = json["name"] ?? "";
    descraption = json["des"] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['price'] = price;
    _data['offers'] = offers;
    _data['id'] = id;
    _data['image'] = image;
    _data['name'] = name;
    _data['des'] = descraption;
    return _data;
  }
}
