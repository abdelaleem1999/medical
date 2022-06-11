// // To parse this JSON data, do
// //
// //     final homeModel = homeModelFromJson(jsonString);
//
// import 'dart:convert';
//
//
//
// class HomeModel {
//   HomeModel({
//     this.data,
//   });
//
//   Data? data;
//
//
// }
//
// class Data {
//   Data({
//     this.banners,
//   });
//
//   List<Banner>? banners;
//
//
// }
//
// class Banner {
//   Banner({
//     this.id,
//     this.image,
//     this.category,
//     this.product,
//   });
//
//   int? id;
//   String? image;
//   dynamic category;
//   dynamic product;
//
//
// }
//
// class Product {
//   Product({
//     this.id,
//     this.price,
//     this.oldPrice,
//     this.discount,
//     this.image,
//     this.name,
//     this.description,
//     this.images,
//     this.inFavorites,
//     this.inCart,
//   });
//
//   int? id;
//   double? price;
//   double? oldPrice;
//   int? discount;
//   String? image;
//   String? name;
//   String? description;
//   List<String>? images;
//   bool? inFavorites;
//   bool? inCart;
//
//
// }
