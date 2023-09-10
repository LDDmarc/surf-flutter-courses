
import 'package:surf_flutter_courses_template/data/task.dart';

enum ProductSorting { none, alphabetAsc, alphabetDesc, priceAsc, priceDesc, categoryAsc, categoryDesc }

extension SortingExtesion on ProductSorting {
  String get title {
    switch (this) {
      case ProductSorting.none:
        return 'Без сортировки';
      case ProductSorting.alphabetAsc:
        return 'По имени  от А до Я';
      case ProductSorting.alphabetDesc:
        return 'По имени  от Я до А';
      case ProductSorting.priceAsc:
        return 'По возрастанию';
      case ProductSorting.priceDesc:
        return 'По убыванию';
      case ProductSorting.categoryAsc:
        return 'По типу от А до Я';
      case ProductSorting.categoryDesc:
        return 'По типу от Я до А';
      default:
        return '';
    }
  }
}

class ProductSortingManager {

  List<ProductEntity> sort(List<ProductEntity> initialList, ProductSorting type) {
    switch (type) {
      case ProductSorting.none:
        return initialList;
      case ProductSorting.alphabetAsc:
        return _alphabeticSort(true, initialList);
      case ProductSorting.alphabetDesc:
        return _alphabeticSort(false, initialList);
      case ProductSorting.priceAsc:
        return _priceSort(true, initialList);
      case ProductSorting.priceDesc:
        return _priceSort(false, initialList);
      case ProductSorting.categoryAsc:
        return _priceSort(true, initialList);
      case ProductSorting.categoryDesc:
        return _priceSort(false, initialList);
      default: /// including category sorting
        return initialList;
    }
  }

  List<ProductEntity> _priceSort(bool isAsc, List<ProductEntity> initialList) {
    var result = initialList;
    result.sort( (a, b) => isAsc ? a.totalPrice.compareTo(b.totalPrice) : b.totalPrice.compareTo(a.totalPrice));
    return result;
  }

  List<ProductEntity> _alphabeticSort(bool isAsc, List<ProductEntity> initialList) {
    var result = initialList;
    result.sort( (a, b) => isAsc ? a.title.compareTo(b.title) : b.title.compareTo(a.title));
    return result;
  }

  int groupComparator(ProductSorting type, Category value1, Category value2) {
    switch (type) {
      case ProductSorting.categoryAsc:
        return value1.name.compareTo(value2.name);
      case ProductSorting.categoryDesc:
        return value2.name.compareTo(value1.name);
      default: /// including category sorting
        return 0;
    }
  }

  Category getTopCategory(ProductSorting type, List<ProductEntity> initialList) {
    var activeCategories = initialList.map((e) => e.category).toSet().toList();
    activeCategories.sort((a, b) => groupComparator(type, a, b));
    return activeCategories.first;
  }

}