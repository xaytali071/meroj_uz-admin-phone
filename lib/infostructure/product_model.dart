class ProductModel{
  final String? code;
  final String? productName;

  ProductModel({this.code, this.productName});

 factory ProductModel.fromJson({required Map data}){
    return ProductModel(
      code: data["code"],
      productName: data["productName"]
    );
  }
}