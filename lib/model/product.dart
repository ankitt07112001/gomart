class ProductLocal {
  final String Pname;
  final String Rate;
  final String Imagepath;
  ProductLocal({
    required this.Pname,
    required this.Rate,
    required this.Imagepath,
  });
  String get _Pname => Pname;
  String get _Rate => Rate;
  String get _Imagepath => Imagepath;
}
