import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/color_palette/support/color_palette_cell_widget.dart';
import 'package:surf_flutter_courses_template/color_palette/color_palette_presenter.dart';
import 'package:surf_flutter_courses_template/color_palette/support/color_cell_presentation.dart';
import 'support/color_palette_view.dart';

class ColorPaletteWidget extends StatefulWidget {
  final ColorPalettePresenter presenter;

  const ColorPaletteWidget({super.key, required this.presenter});

  @override
  State<ColorPaletteWidget> createState() => _ColorPaletteWidgetState(presenter: presenter);
}

class _ColorPaletteWidgetState extends State<ColorPaletteWidget> implements ColorPaletteView {
  final ColorPalettePresenter presenter;
  Future<ColorList>? _loadColors;

  _ColorPaletteWidgetState({required this.presenter});

  @override
  void initState() {
    super.initState();
    presenter.setView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
            children: [
              _makeHeader(),
              const SizedBox(height: 42),
              Expanded(child: _makeGrid())
            ],
        )
    );
  }

  @override
  void updateData(Future<ColorList> data) {
    setState(() {
      _loadColors = data;
    });
  }

  Widget _makeGrid() {
    return FutureBuilder<ColorList>(
        future: _loadColors,
        builder: (BuildContext context, AsyncSnapshot<ColorList> snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 5/7,
                mainAxisSpacing: 40,
                crossAxisSpacing: 22,
                children: snapshot.data!.asMap().map((index, element) =>  MapEntry(index, _makeCell(element, index))).values.toList()
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }

  Widget _makeHeader() {
    return const Text(
    'Эксклюзивная палитра «Colored Box»',
    style: TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black
    )
    );
  }

  Widget _makeCell(ColorCellPresentation cellPresentation, int index) {
    return ColorPaletteCellWidget(
        cellPresentation: cellPresentation,
        onTap: () { presenter.onTapItemAt(index: index); },
        onLongTap: () { presenter.onLongTapItemAt(index: index); },
    );
  }

}
