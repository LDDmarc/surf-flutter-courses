import 'package:flutter/material.dart';
import 'support/color_detail_presentation.dart';
import 'color_detail_presenter.dart';

class ColorDetailWidget extends StatefulWidget {
  final ColorDetailPresenter presenter;

  const ColorDetailWidget({super.key, required this.presenter});

  @override
  State<ColorDetailWidget> createState() => _ColorDetailWidgetState(presenter.detailPresentation);
}

class _ColorDetailWidgetState extends State<ColorDetailWidget> {
  final ColorDetailPresentation detailPresentation;

  _ColorDetailWidgetState(this.detailPresentation);

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
                  child: _makeShadowedRow('Hex', detailPresentation.hexSubtitle),
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

  Widget _makeShadowedRow(String title, String value) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF252838).withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 12), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            Text(value, style: const TextStyle(fontSize: 16))
          ],
          ),
        )
    );
  }

  Widget _makeRGBRow() {
    return Row(
      children: [
        Expanded(child: _makeShadowedRow('Red', detailPresentation.redValue)),
        const SizedBox(width: 17),
        Expanded(child: _makeShadowedRow('Green', detailPresentation.greenValue)),
        const SizedBox(width: 17),
        Expanded(child: _makeShadowedRow('Blue', detailPresentation.blueValue)),
      ],
    );
  }

}