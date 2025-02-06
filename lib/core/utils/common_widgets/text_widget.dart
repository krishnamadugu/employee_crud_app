import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.txtVal,
    this.textAlign,
    this.localeVal,
    this.softWrap,
    this.textOverflow,
    this.maxLines,
    this.selectionColorVal,
    this.textStyle,
  });

  final String txtVal;
  final TextAlign? textAlign;
  final Locale? localeVal;
  final bool? softWrap;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final Color? selectionColorVal;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      txtVal,
      textAlign: textAlign ?? TextAlign.start,
      locale: localeVal,
      softWrap: softWrap ?? true,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      maxLines: maxLines ?? 1,
      selectionColor: selectionColorVal ?? Colors.white,
      style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
    );
  }
}
