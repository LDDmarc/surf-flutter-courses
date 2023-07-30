
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
        return _categorySort(true, initialList);
      case ProductSorting.categoryDesc:
        return _categorySort(false, initialList);
      default:
        return initialList;
    }
  }

  List<ProductEntity> _priceSort(bool isAsc, List<ProductEntity> initialList) {
    var result = initialList;
    result.sort( (a, b) => isAsc ? a.price.compareTo(b.price) : b.price.compareTo(a.price));
    return result;
  }

  List<ProductEntity> _alphabeticSort(bool isAsc, List<ProductEntity> initialList) {
    var result = initialList;
    result.sort( (a, b) => isAsc ? a.title.compareTo(b.title) : b.title.compareTo(a.title));
    return result;
  }

  List<ProductEntity> _categorySort(bool isAsc, List<ProductEntity> initialList) {
    var result = initialList;
    // result.sort( (a, b) => isAsc ? a.category..compareTo(b.category) : b.category.compareTo(a.category));
    return result;
  }

}