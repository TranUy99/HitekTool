import 'package:flutter/material.dart';

extension GapPackageListExtension<T extends Widget> on List<T> {
  List<Widget> gapVertical(double mainAxisExtent) {
    return _gap(mainAxisExtent, isVertical: true).toList();
  }

  List<Widget> gapHorizontal(double mainAxisExtent) {
    return _gap(mainAxisExtent, isVertical: false).toList();
  }

  Iterable<Widget> _gap(double mainAxisExtent, {required bool isVertical}) sync* {
    final maxIndex = length - 1;
    for (var i = 0; i <= maxIndex; i++) {
      yield elementAt(i);
      if (i != maxIndex) {
        yield SizedBox(
          height: isVertical ? mainAxisExtent : 0,
          width: isVertical ? 0 : mainAxisExtent,
        );
      }
    }
  }
}
