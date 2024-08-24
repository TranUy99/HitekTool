import 'package:flutter/material.dart';

class WrapPage extends StatefulWidget {
  final Widget child;
  final Color? statusBarColor;
  final Color? bottomBarColor;
  final Color? backgroundColor;
  final Key? scaffoldKey;
  final Widget? drawer;
  final Widget? endDrawer;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;
  final bool? isSafeArea;
  final Key? formKey;
  final bool? isSafeAreaTop;
  final bool? isSafeAreaBottom;
  final Function? onTap;

  const WrapPage({
    super.key,
    required this.child,
    this.statusBarColor,
    this.bottomBarColor,
    this.backgroundColor,
    this.scaffoldKey,
    this.drawer,
    this.appBar,
    this.endDrawer,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = true,
    this.isSafeArea = true,
    this.formKey,
    this.isSafeAreaTop,
    this.isSafeAreaBottom,
    this.onTap,
  });

  @override
  WrapPageState createState() => WrapPageState();
}

class WrapPageState extends State<WrapPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var statusBarColor = widget.statusBarColor ?? colorScheme.background;
    var bottomBarColor = widget.bottomBarColor ?? colorScheme.background;
    var backgroundColor = widget.backgroundColor;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode()); // hide keyboard when touch anywhere
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Form(
        key: widget.formKey,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: statusBarColor,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: bottomBarColor,
                  ),
                ),
              ],
            ),
            SafeArea(
              top: widget.isSafeAreaTop ?? widget.isSafeArea!,
              left: widget.isSafeArea!,
              right: widget.isSafeArea!,
              bottom: widget.isSafeAreaBottom ?? widget.isSafeArea!,
              child: Scaffold(
                resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
                backgroundColor: backgroundColor,
                appBar: widget.appBar,
                key: widget.scaffoldKey,
                body: widget.child,
                drawer: widget.drawer,
                endDrawer: widget.endDrawer,
                bottomNavigationBar: widget.bottomNavigationBar,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
