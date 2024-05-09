class Food {
  var id;
  String name;
  String imagepath;
  String price;
  var con;
  var qty;
  var isFav;

  Food(
      {required this.id,
      required this.price,
      required this.imagepath,
      required this.name,
      this.qty = 1,
      this.isFav = false,
      this.con = ""});
  String get _name => name;
  String get _imagepath => imagepath;
  String get _price => price;
  get _qty => qty;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        imagepath: json["imagepath"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imagepath": imagepath,
        "name": name,
        "price": price,
      };
}
