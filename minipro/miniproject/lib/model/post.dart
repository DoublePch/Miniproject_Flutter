// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    Post({
        required this.stockId,
        required this.stockQty,
        required this.stockCost,
        required this.stockMin,
        required this.stockTimeStamp,
        required this.stockTypeId,
    });

    int stockId;
    int stockQty;
    int stockCost;
    int stockMin;
    DateTime stockTimeStamp;
    StockTypeId stockTypeId;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        stockId: json["stock_ID"],
        stockQty: json["stock_Qty"],
        stockCost: json["stock_Cost"],
        stockMin: json["stock_Min"],
        stockTimeStamp: DateTime.parse(json["stock_TimeStamp"]),
        stockTypeId: StockTypeId.fromJson(json["stockType_ID"]),
    );

    Map<String, dynamic> toJson() => {
        "stock_ID": stockId,
        "stock_Qty": stockQty,
        "stock_Cost": stockCost,
        "stock_Min": stockMin,
        "stock_TimeStamp": stockTimeStamp.toIso8601String(),
        "stockType_ID": stockTypeId.toJson(),
    };
}

class StockTypeId {
    StockTypeId({
        required this.stockTypeId,
        required this.stockTypeName,
    });

    int stockTypeId;
    String stockTypeName;

    factory StockTypeId.fromJson(Map<String, dynamic> json) => StockTypeId(
        stockTypeId: json["stockType_ID"],
        stockTypeName: json["stockType_Name"],
    );

    Map<String, dynamic> toJson() => {
        "stockType_ID": stockTypeId,
        "stockType_Name": stockTypeName,
    };
}
