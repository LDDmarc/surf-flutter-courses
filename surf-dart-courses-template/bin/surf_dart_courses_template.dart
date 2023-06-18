import 'package:surf_dart_courses_template/surf_dart_courses_template.dart' as surf_dart_courses_template;

typedef Category = String;
typedef Subcategory = String;
typedef Product = String;

class RawProductItem {
  Product name;
  Category categoryName;
  Subcategory subcategoryName;
  DateTime expirationDate;
  int qty;

  RawProductItem({
    required this.name,
    required this.categoryName,
    required this.subcategoryName,
    required this.expirationDate,
    required this.qty
  });
}

typedef CategoryMap = Map<Category, SubcategoryMap>;
typedef SubcategoryMap = Map<Subcategory, List<Product>>;

CategoryMap solution1() {
  /// 2 separate cycles for sorting and filling map
  final sortedItems = items.where((item) => item.expirationDate.isAfter(DateTime.now()) && item.qty > 0);
  CategoryMap resultMap = {};

  for (final item in sortedItems) {
    SubcategoryMap subcategories = resultMap[item.categoryName] ?? {};
    List<Product> products = subcategories[item.subcategoryName] ?? [];
    products.add(item.name);
    subcategories[item.subcategoryName] = products;
    resultMap[item.categoryName] = subcategories;
  }
  return resultMap;
}

CategoryMap solution2() {
  CategoryMap resultMap = {};

  for (final item in items) {
    if (item.expirationDate.isBefore(DateTime.now()) || item.qty == 0) {
      continue;
    }
    resultMap.putIfAbsent(item.categoryName, () => <Subcategory, List<Product>>{});
    resultMap[item.categoryName]?.putIfAbsent(item.subcategoryName, () => <Product>[]);
    resultMap[item.categoryName]?[item.subcategoryName]?.add(item.name);
  }
  return resultMap;
}

void main(List<String> arguments) {
  // final result = solution1();
  final result = solution2();

  result.forEach((key, value) {
    print('$key: $value');
  });
}

final items = [
  RawProductItem(
    name: 'Персик',
    categoryName: 'Растительная пища',
    subcategoryName: 'Фрукты',
    expirationDate: DateTime(2023, 12, 22),
    qty: 5,
  ),
  RawProductItem(
    name: 'Молоко',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Напитки',
    expirationDate: DateTime(2023, 12, 22),
    qty: 5,
  ),
  RawProductItem(
    name: 'Кефир',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Напитки',
    expirationDate: DateTime(2023, 12, 22),
    qty: 5,
  ),
  RawProductItem(
    name: 'Творог',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Не напитки',
    expirationDate: DateTime(2022, 12, 22),
    qty: 0,
  ),
  RawProductItem(
    name: 'Творожок',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Не напитки',
    expirationDate: DateTime(2022, 12, 22),
    qty: 0,
  ),
  RawProductItem(
    name: 'Творог',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Не напитки',
    expirationDate: DateTime(2023, 12, 22),
    qty: 0,
  ),
  RawProductItem(
    name: 'Гауда',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Сыры',
    expirationDate: DateTime(2022, 12, 22),
    qty: 3,
  ),
  RawProductItem(
    name: 'Маасдам',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Сыры',
    expirationDate: DateTime(2023, 12, 22),
    qty: 2,
  ),
  RawProductItem(
    name: 'Яблоко',
    categoryName: 'Растительная пища',
    subcategoryName: 'Фрукты',
    expirationDate: DateTime(2022, 12, 4),
    qty: 4,
  ),
  RawProductItem(
    name: 'Морковь',
    categoryName: 'Растительная пища',
    subcategoryName: 'Овощи',
    expirationDate: DateTime(2023, 12, 23),
    qty: 51,
  ),
  RawProductItem(
    name: 'Черника',
    categoryName: 'Растительная пища',
    subcategoryName: 'Ягоды',
    expirationDate: DateTime(2023, 12, 25),
    qty: 0,
  ),
  RawProductItem(
    name: 'Курица',
    categoryName: 'Мясо',
    subcategoryName: 'Птица',
    expirationDate: DateTime(2023, 12, 18),
    qty: 2,
  ),
  RawProductItem(
    name: 'Говядина',
    categoryName: 'Мясо',
    subcategoryName: 'Не птица',
    expirationDate: DateTime(2023, 12, 17),
    qty: 0,
  ),
  RawProductItem(
    name: 'Телятина',
    categoryName: 'Мясо',
    subcategoryName: 'Не птица',
    expirationDate: DateTime(2022, 12, 17),
    qty: 0,
  ),
  RawProductItem(
    name: 'Индюшатина',
    categoryName: 'Мясо',
    subcategoryName: 'Птица',
    expirationDate: DateTime(2022, 12, 17),
    qty: 0,
  ),
  RawProductItem(
    name: 'Утка',
    categoryName: 'Мясо',
    subcategoryName: 'Птица',
    expirationDate: DateTime(2023, 12, 18),
    qty: 0,
  ),
  RawProductItem(
    name: 'Гречка',
    categoryName: 'Растительная пища',
    subcategoryName: 'Крупы',
    expirationDate: DateTime(2023, 12, 22),
    qty: 8,
  ),
  RawProductItem(
    name: 'Свинина',
    categoryName: 'Мясо',
    subcategoryName: 'Не птица',
    expirationDate: DateTime(2023, 12, 23),
    qty: 5,
  ),
  RawProductItem(
    name: 'Груша',
    categoryName: 'Растительная пища',
    subcategoryName: 'Фрукты',
    expirationDate: DateTime(2023, 12, 25),
    qty: 5,
  ),
];

