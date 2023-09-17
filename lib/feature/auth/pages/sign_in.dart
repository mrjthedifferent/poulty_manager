import 'package:flutter/material.dart';
import 'package:poulty_manager/gen/assets.gen.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/Layout/extension.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return <Widget>[Assets.images.appHen.image(), Styled.text("hello")]
        .toColumn()
        .parent(blankPage);
  }
}
