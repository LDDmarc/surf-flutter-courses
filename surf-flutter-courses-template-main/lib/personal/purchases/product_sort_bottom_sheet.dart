import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/appearance.dart';
import 'product_sorting_manager.dart';

class ProductSortingBottomSheetWidget extends StatefulWidget {
  final ProductSorting sortingType;
  final void Function(ProductSorting?) onSortingTypeSelected;

  const ProductSortingBottomSheetWidget({super.key, required this.sortingType, required this.onSortingTypeSelected });

  @override
  State<StatefulWidget> createState() {
    return _ProductSortingBottomSheetState(sortingType, onSortingTypeSelected: onSortingTypeSelected);
  }
}

class _ProductSortingBottomSheetState extends State<ProductSortingBottomSheetWidget> {
  ProductSorting? _groupValue;
  void Function(ProductSorting?) onSortingTypeSelected;

  _ProductSortingBottomSheetState(this._groupValue, { required this.onSortingTypeSelected });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
            child: _makeHeader(),
        ),
        Expanded(
          flex: 100,
            child: ListView(
              children: [
                _makeRadioRow(ProductSorting.none),
                _makeDivider(),
                _makeSortSection('По имени', [ProductSorting.alphabetDesc, ProductSorting.alphabetAsc]),
                _makeDivider(),
                _makeSortSection('По цене', [ProductSorting.priceAsc, ProductSorting.priceDesc]),
                _makeDivider(),
                _makeSortSection('По типу', [ProductSorting.categoryAsc, ProductSorting.categoryDesc]),
              ],
            )
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: _makeButton(),
        ),
      ],
    );
  }

  Widget _makeDivider() {
    return const Divider(
      thickness: 1,
      color: Appearance.separatorColor,
      indent: 20, endIndent: 20,
    );
  }

  Widget _makeSortSection(String category, List<ProductSorting> values) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          SizedBox(
            height: 20,
            child:
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text(category, style: const TextStyle(fontSize: 11, color: Appearance.subtitleColor))
                  ],
                )
          ),
          _makeRadioRow(values[0]),
          _makeRadioRow(values[1]),
      ],
    );
  }
  
  Widget _makeRadioRow(ProductSorting value) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          const SizedBox(width: 5),
          Radio<ProductSorting>(
            value: value,
            groupValue: _groupValue,
            onChanged: (ProductSorting? value) {
              setState(() {
                _groupValue = value;
              });
            },
            fillColor: MaterialStateColor.resolveWith((states) => Appearance.accentColor),
          ),
          Text(value.title),
        ],
      )
    );
  }

  Widget _makeButton() {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      foregroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      backgroundColor: Appearance.accentColor
    );
    return Row(
        children: [
          Expanded(child: TextButton(
              style: flatButtonStyle,
              onPressed: (){
                  Navigator.pop(context);
                  onSortingTypeSelected(_groupValue ?? ProductSorting.none);
                },
              child: const Text('Готово')
          )
          )
        ]
    );
  }

  Widget _makeHeader() {
    return Row(
      children: [
        const Text('Сортировка', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const Spacer(),
        Container(
          height: 24,
          width: 24,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){ Navigator.pop(context); },
            icon: const Icon(Icons.close),
            iconSize: 24,
          ),
        ),
      ],
    );
  }
}