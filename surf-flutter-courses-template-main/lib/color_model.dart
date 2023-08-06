
class ColorModel {
  final String name;
  final String? value;

  ColorModel(this.name, this.value);

  ColorModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        value = json['value'];

}