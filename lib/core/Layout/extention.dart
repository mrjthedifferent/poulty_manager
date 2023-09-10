import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../gen/assets.gen.dart';
import 'widget/base_app_bar.dart';

Widget page({required Widget child}) => Styled.builder(
    builder: (context, ch) {
      return Scaffold(
        appBar: defaultAppBar(context),
        body: Styled.widget(child: ch)
            .padding(vertical: 30, horizontal: 20)
            .scrollable()
            .safeArea(),
      );
    },
    child: child);

//  Widget page = ({Widget child}) => Styled.widget(child: child)
//         .padding(vertical: 30, horizontal: 20)
//         .constrained(minHeight: MediaQuery.of(context).size.height - (2 * 30))
//         .scrollable();
extension Layout on Widget {
  Scaffold warpScaffold({
    Key? key,
    PreferredSizeWidget? appBar,
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    FloatingActionButtonAnimator? floatingActionButtonAnimator,
    List<Widget>? persistentFooterButtons,
    Widget? drawer,
    DrawerCallback? onDrawerChanged,
    Widget? endDrawer,
    DrawerCallback? onEndDrawerChanged,
    Color? backgroundColor,
    Color? bottomNavigationBarColor,
    double? elevation,
    bool primary = true,
    DragStartBehavior? drawerDragStartBehavior,
    bool extendBody = false,
    bool extendBodyBehindAppBar = false,
    double? drawerScrimColorAlpha,
    Color? drawerScrimColor,
    double? drawerEdgeDragWidth,
    bool? drawerEnableOpenDragGesture,
    bool? endDrawerEnableOpenDragGesture,
    bool? resizeToAvoidBottomInset,
    bool? restoreGeometry,
  }) {
    return Scaffold(
      key: key,
      appBar: appBar,
      body: this,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      drawer: drawer,
      onDrawerChanged: onDrawerChanged,
      primary: primary,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      endDrawer: endDrawer,
      onEndDrawerChanged: onEndDrawerChanged,
      backgroundColor: backgroundColor,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }

  Widget wrapLayout({
    PreferredSizeWidget? appBar,
    FloatingActionButton? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
    Widget? bottomNavigationBar,
    int currentIndex = 0,
    Function(int)? onTap,
  }) {
    return Styled.builder(
        builder: (context, child) => Scaffold(
            body: child,
            appBar: appBar ?? defaultAppBar(context),
            floatingActionButtonLocation: floatingActionButtonLocation ??
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              disabledElevation: 0.0,
              elevation: 0.0,
              clipBehavior: Clip.antiAlias,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: const CircleBorder(),
              onPressed: () {},
              child: Assets.icons.floatHome.svg(),
            ),
            bottomNavigationBar: bottomNavigationBar),
        child: this);
  }
}
