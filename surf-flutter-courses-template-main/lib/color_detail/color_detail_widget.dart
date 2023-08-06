import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/color_detail/support/color_detail_shadowed_box.dart';
import 'support/color_detail_presentation.dart';
import 'color_detail_presenter.dart';

class ColorDetailWidget extends StatefulWidget {
  final ColorDetailPresenter presenter;

  const ColorDetailWidget({super.key, required this.presenter});

  @override
  State<ColorDetailWidget> createState() => _ColorDetailWidgetState(presenter);
}

class _ColorDetailWidgetState extends State<ColorDetailWidget> {
  final ColorDetailPresenter presenter;
  final ColorDetailPresentation detailPresentation;

  _ColorDetailWidgetState(this.presenter) : detailPresentation = presenter.detailPresentation;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0,
      backgroundColor: detailPresentation.color,
      leading: BackButton(
        onPressed: (){ Navigator.pop(context); },
      ),
    );

    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu', scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        appBar: appBar,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                height: constraints.maxHeight / 2 - appBar.preferredSize.height,
                  width: MediaQuery.of(context).size.width,
                  color: detailPresentation.color,
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Text(
                      detailPresentation.title,
                      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: ColorDetailShadowedBox(
                      title: 'Hex',
                      value: detailPresentation.hexSubtitle,
                      onTap: (){ presenter.copyToClipboard(detailPresentation.hexSubtitle); }
                  )
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: _makeRGBRow()
                )
              ],
            ); 
          }
        ),
      ),
    );
  }

  Widget _makeRGBRow() {
    return Row(
      children: [
        Expanded(
            child: ColorDetailShadowedBox(
                title: 'Red',
                value: detailPresentation.redValue,
                onTap: (){ presenter.copyToClipboard(detailPresentation.redValue); }
          )
        ),
        const SizedBox(width: 17),
        Expanded(
            child: ColorDetailShadowedBox(
                title: 'Green',
                value: detailPresentation.greenValue,
                onTap: (){ presenter.copyToClipboard(detailPresentation.greenValue); }
            )
        ),
        const SizedBox(width: 17),
        Expanded(
            child: ColorDetailShadowedBox(
                title: 'Blue',
                value: detailPresentation.redValue,
                onTap: (){ presenter.copyToClipboard(detailPresentation.blueValue); }
            )
        ),
      ],
    );
  }

}