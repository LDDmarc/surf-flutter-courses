import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/appearance.dart';
import 'package:surf_flutter_courses_template/custom_app_bar.dart';
import 'package:surf_flutter_courses_template/data/data.dart';
import 'package:surf_flutter_courses_template/personal/purchases/product_cell.dart';
import 'product_sort_bottom_sheet.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class ProductListScreenWidget extends StatefulWidget {
  final Cheque cheque;

  const ProductListScreenWidget({super.key, required this.cheque});

  @override
  State<StatefulWidget> createState() {
    return _ProductListScreenState(cheque);
  }
}

class _ProductListScreenState extends State<ProductListScreenWidget> {
  final Cheque cheque;

  _ProductListScreenState(this.cheque);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: cheque.title,
        subtitle: cheque.dateString,
        isBackButtonHidden: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            const SizedBox(height: 24), // todo: correct size
            _makeHeader(),
            const SizedBox(height: 16),
            Expanded(child: ListView.builder(
                  itemCount: cheque.productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCellWidget(product: cheque.productList[index]);
                  }
              ),
            ),
            const Divider(
              color: Appearance.separatorColor,
              thickness: 1,
            ),
            const SizedBox(height: 8),
            _makeFooter(cheque),
            const SizedBox(height: 24),
          ]
        )
      )
    );
  }

  Widget _makeHeader() {
    return Row(
      children: [
        const Text('Список покупок', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const Spacer(),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Appearance.separatorColor,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){ _showSortingModal(); },
            icon: const Icon(Icons.sort),
            iconSize: 24,
            color: Appearance.iconColor,
          ),
        ),
      ],
    );
  }

  void _showSortingModal() {
    showFlexibleBottomSheet(
        initHeight: 0.8,
        maxHeight: 0.8,
        minHeight: 0.5,
        bottomSheetColor: Colors.transparent,
        context: context,
        builder: _makeBottomSheet,
        isExpand: true
    );
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

  Widget _buildBottomSheet(BuildContext context) {
      return Container(
        height: 692,
        child: ProductSortingBottomSheetWidget()
      );
  }

  Widget _makeBottomSheet(
      BuildContext context,
      ScrollController scrollController,
      double bottomSheetOffset
      ) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0)
          ),
        color: Appearance.backgroundColor
      ),
      child: ProductSortingBottomSheetWidget(),
    );
  }
}
