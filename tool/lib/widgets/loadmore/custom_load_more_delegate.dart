import 'package:tool/common/theme/styles.dart';
import 'package:tool/widgets/loadmore/custom_loadmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const double LOADMORE_INDICATOR_SIZE = 24;
const double HEIGHT_LOADMORE_WIDGET = 80;

class CustomLoadMoreDelegate extends LoadMoreDelegate {
  const CustomLoadMoreDelegate();

  @override
  double widgetHeight(LoadMoreStatus status) => status == LoadMoreStatus.loading ? HEIGHT_LOADMORE_WIDGET : 0;

  @override
  Widget buildChild(LoadMoreStatus status, {LoadMoreTextBuilder builder = DefaultLoadMoreTextBuilder.chinese}) {
    if (status == LoadMoreStatus.loading) {
      return Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SizedBox(
                width: widthScale(30),
                height: widthScale(30),
                child: const SpinKitFadingCircle(
                  color: Colors.black,
                  size: 30,
                  duration: Duration(milliseconds: 800),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container();
  }
}
