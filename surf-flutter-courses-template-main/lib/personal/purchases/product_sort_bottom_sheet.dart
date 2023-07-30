import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/appearance.dart';

enum _Sorting { none, alphabetAsc, alphabetDesc, priceAsc, priceDesc, categoryAsc, categoryDesc }
extension _SortingExtesion on _Sorting {
  String get title {
    switch (this) {
      case _Sorting.none:
        return 'Без сортировки';
      case _Sorting.alphabetAsc:
        return 'По имени  от А до Я';
      case _Sorting.alphabetDesc:
        return 'По имени  от Я до А';
      case _Sorting.priceAsc:
        return 'По возрастанию';
      case _Sorting.priceDesc:
        return 'По убыванию';
      case _Sorting.categoryAsc:
        return 'По типу от А до Я';
      case _Sorting.categoryDesc:
        return 'По типу от Я до А';
      default:
        return '';
    }
  }
}

class ProductSortingBottomSheetWidget extends StatefulWidget {

  const ProductSortingBottomSheetWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductSortingBottomSheetState();
  }
}

class _ProductSortingBottomSheetState extends State<ProductSortingBottomSheetWidget> {
  _Sorting? _groupValue = _Sorting.none;

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
                _makeRadioRow(_Sorting.none),
                _makeDivider(),
                _makeSortSection('По имени', [_Sorting.alphabetDesc, _Sorting.alphabetAsc]),
                _makeDivider(),
                _makeSortSection('По цене', [_Sorting.priceAsc, _Sorting.priceDesc]),
                _makeDivider(),
                _makeSortSection('По типу', [_Sorting.categoryAsc, _Sorting.categoryDesc]),
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

  Widget _makeSortSection(String category, List<_Sorting> values) {
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
  
  Widget _makeRadioRow(_Sorting value) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          const SizedBox(width: 5),
          Radio<_Sorting>(
            value: value,
            groupValue: _groupValue,
            onChanged: (_Sorting? value) {
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
      primary: Colors.white,
      minimumSize: Size(88, 48),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      backgroundColor: Appearance.accentColor
    );
    return Row(
        children: [
          Expanded(child: TextButton(
              style: flatButtonStyle,
              onPressed: (){},
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