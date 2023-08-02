import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/common/appearance.dart';
import 'package:surf_flutter_courses_template/common/custom_app_bar.dart';
import 'package:surf_flutter_courses_template/data/data.dart';
import 'package:surf_flutter_courses_template/personal/purchases/product_cell.dart';
import '../../data/task.dart';
import 'product_sort_bottom_sheet.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'product_sorting_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grouped_list/grouped_list.dart';

class ProductListScreenWidget extends StatefulWidget {
  final Cheque cheque;

  const ProductListScreenWidget({super.key, required this.cheque});

  @override
  State<StatefulWidget> createState() =>_ProductListScreenState(cheque);
}

class _ProductListScreenState extends State<ProductListScreenWidget> {
  final Cheque cheque;
  final productSortingManager = ProductSortingManager();

  List<ProductEntity> _productList;
  ProductSorting _type = ProductSorting.none;
  bool _isLoading;

  _ProductListScreenState(this.cheque) :
        _productList = cheque.productList,
        _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: cheque.title,
        subtitle: cheque.dateString,
        isBackButtonHidden: false,
      ),
      body: ((){
        if (_isLoading) {
          return const Center(child: CircularProgressIndicator(color: Appearance.accentColor));
        } else {
          if (_productList.isNotEmpty) {
            return _makeContent();
          } else {
            return const Center(child: Text('Здесь пока ничего нет'));
          }
        }
      }())
    );
  }

  Widget _makeContent() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
            children: [
              const SizedBox(height: 24), // todo: correct size
              _makeHeader(),
              const SizedBox(height: 16),
              ((){
                switch (_type) {
                  case ProductSorting.categoryDesc:
                    return _makeGroupedList(_productList);
                  case ProductSorting.categoryAsc:
                    return _makeGroupedList(_productList);
                  default:
                    return _makeSimpleList(_productList);
                }
              }()),
              const Divider(
                color: Appearance.separatorColor,
                thickness: 1,
              ),
              const SizedBox(height: 8),
              _makeFooter(cheque),
              const SizedBox(height: 24),
            ]
        )
    );
}

  Widget _makeHeader() {
    return Row(
      children: [
        const Text('Список покупок', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const Spacer(),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: (){ _showSortingModal(); },
          icon: SvgPicture.asset(_type == ProductSorting.none ? 'assets/products_sort.svg' : 'assets/products_sort_active.svg'),
          iconSize: 24,
          color: Appearance.iconColor,
        ),
      ],
    );
  }

  Widget _makeSimpleList(List<ProductEntity> products) {
    return Expanded(
      child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCellWidget(product: products[index]);
          }
      ),
    );
  }

  Widget _makeGroupedList(List<ProductEntity> products) {
    return Expanded(
      child: GroupedListView<ProductEntity, Category>(
        elements: products,
        groupBy: (element) => element.category,
        groupSeparatorBuilder: (Category category) => _makeSectionHeader(category),
        itemBuilder: (context, ProductEntity element) => ProductCellWidget(product: element),
        groupComparator: (item1, item2) => productSortingManager.groupComparator(_type, item1, item2)
      ),
    );
  }

  void _showSortingModal() {
    showFlexibleBottomSheet(
        initHeight: 0.9,
        bottomSheetColor: Colors.transparent,
        context: context,
        builder: _makeBottomSheet,
        isExpand: true,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)
            ),
            color: Appearance.backgroundColor
        ),
    );
  }

  Widget _makeSectionHeader(Category category) {
      if (productSortingManager.getTopCategory(_type, _productList) == category) {
        return Text(category.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16));
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(thickness: 1, color: Appearance.separatorColor),
            const SizedBox(height: 20),
            Text(category.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
          ],
        );
      }
  }

  Widget _makeFooter(Cheque cheque) {
    const largeStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('В вашей покупке', style: largeStyle),
          const SizedBox(height: 14),
          _makeDetailRow(cheque.totalCountString, cheque.startPriceString, 12),
          const SizedBox(height: 14),
          _makeDetailRow(cheque.totalDiscountString, cheque.totalDiffString, 12),
          const SizedBox(height: 18),
          Row(
            children: [
              const Text('Итого', style: largeStyle),
              const Spacer(),
              Text(cheque.totalPriceString, style: largeStyle),
            ],
          )
        ],
      );
  }

  Widget _makeDetailRow(String title, String value, double fontSize) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontSize: fontSize)),
        const Spacer(),
        Text(value, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _makeBottomSheet(
      BuildContext context,
      ScrollController scrollController,
      double bottomSheetOffset
      ) {
    return ProductSortingBottomSheetWidget(
      sortingType: _type,
      onSortingTypeSelected: (sortingType) {
        _imitateLoading();
        setState(() {
          _type = sortingType ?? ProductSorting.none;
          _productList = productSortingManager.sort(_productList, _type);
        });
      });
  }

  void _imitateLoading() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isLoading = false;
    });
  }
}
