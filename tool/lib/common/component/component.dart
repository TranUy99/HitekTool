import 'package:tool/common/component/component_border.dart';
import 'package:tool/common/component/component_color.dart';
import 'package:tool/common/component/component_radius.dart';
import 'package:tool/common/component/component_shadow.dart';
import 'package:tool/common/component/component_text_style.dart';

class Component {
  static final ComponentRadius radius = ComponentRadius();

  static final ComponentBorder border = ComponentBorder();

  static final ComponentColor color = ComponentColor();

  static final ComponentTextStyle textStyle = ComponentTextStyle();

  static final ComponentShadow shadow = ComponentShadow();
}
