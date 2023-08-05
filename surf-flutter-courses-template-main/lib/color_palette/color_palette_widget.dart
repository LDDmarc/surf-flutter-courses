import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/color_palette/color_palette_presenter.dart';
import 'support/color_palette_view.dart';

class ColorPaletteWidget extends StatefulWidget {
  final ColorPalettePresenter presenter;

  const ColorPaletteWidget({super.key, required this.presenter});

  @override
  State<ColorPaletteWidget> createState() => _ColorPaletteWidgetState();
}

class _ColorPaletteWidgetState extends State<ColorPaletteWidget> implements ColorPaletteView {
  Future<ColorList>? _loadColors;

  @override
  void initState() {
    super.initState();
    widget.presenter.setView(this);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ColorList>(
        future: _loadColors,
        builder: (BuildContext context, AsyncSnapshot<ColorList> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text(snapshot.data![index].title));
                }
                );
          } else {
            return Center(child: Text('loading'));
          }
        }
    );
  }

  @override
  void updateData(Future<ColorList> data) {
    setState(() {
      _loadColors = data;
    });
  }

  // Widget _makeCell() {
  //
  // }
}
