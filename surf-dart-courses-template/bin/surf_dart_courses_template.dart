import 'package:surf_dart_courses_template/surf_dart_courses_template.dart' as surf_dart_courses_template;

class Product {
  late final int id;
  late final String category;
  late final String name;
  late final int price;
  late final int quantity;

  Product(this.id, this.category, this.name, this.price, this.quantity);

  Product.from({required String input}) {
    final elements = input.split(',');
    id = int.parse(elements[0]);
    category = elements[1];
    name = elements[2];
    price = int.parse(elements[3]);
    quantity = int.parse(elements[4]);
  }

  @override
  String toString() {
    return '$id\t$category\t$name\t$price рублей \t$quantity шт';
  }

}

abstract class Filter {
  bool apply(Product product);
}

class CategoryFilter implements Filter {

  final String categoryName;

  CategoryFilter(this.categoryName);

  @override
  bool apply(Product product) => product.category == categoryName;

}

class PriceFilter implements Filter {

  final int priceLimit;

  PriceFilter(this.priceLimit);

  @override
  bool apply(Product product) => product.price <= priceLimit;

}

class QuantityFilter implements Filter {

  final int quantityLimit;

  QuantityFilter(this.quantityLimit);

  @override
  bool apply(Product product) => product.quantity < quantityLimit;

}

void applyFilter({ required List<Product> products, required Filter filter }) {
  products.where((element) => filter.apply(element)).forEach((element) { print(element); });
}

void main(List<String> arguments) {
  final articles = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';
  final inputStrings = articles.split('\n');
  final products = inputStrings.take(inputStrings.length - 1).map((e) => Product.from(input: e)).toList(growable: false);

  print('Категория: хлеб');
  applyFilter(products: products, filter: CategoryFilter('хлеб'));

  print('Категория: цена ниже 210');
  applyFilter(products: products, filter: PriceFilter(210));

  print('Категория: количество ниже 16');
  applyFilter(products: products, filter: QuantityFilter(16));
}
