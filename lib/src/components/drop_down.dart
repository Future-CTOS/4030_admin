import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../infrastructures/utils/spacing.dart';

typedef ItemAsString<T> = String Function(T item);
typedef OnChanged<T> = void Function(T?)?;

class CustomDropDown<T> extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.items,
    required this.getTitle,
    required this.value,
    this.onSelectItem,
    this.hint,
    this.onClear,
    this.icon,
    this.defaultIcon = false,
  });

  final List<T> items;
  final String? hint;
  final bool defaultIcon;
  final ItemAsString<T> getTitle;
  final OnChanged<T>? onSelectItem;
  final T? value;
  final Widget? icon;
  final VoidCallback? onClear;

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  @override
  Widget build(BuildContext context) =>
      Padding(padding: AppSpacing.mediumPadding, child: _decoration());

  Widget _decoration() => DecoratedBox(
    decoration: BoxDecoration(
      border: Border.all(
        color: Theme.of(context).colorScheme.onSecondary,
        width: 0.3,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    child: _dropdown(),
  );

  Widget _dropdown() => DropdownButtonHideUnderline(
    child: DropdownButton<T>(
      isExpanded: true,
      elevation: 1,
      hint: widget.hint != null
          ? Center(
              child: Text(
                '${widget.hint}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
          : null,
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.mediumSpace),
      iconEnabledColor: Colors.black,
      icon:
          widget.icon ??
          Icon(
            Icons.keyboard_arrow_down,
            size: AppSpacing.xLargeSpace,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
      menuMaxHeight: 200,
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      value: widget.value,
      style: Theme.of(context).textTheme.bodyMedium,
      onChanged: (T? value) {
        if (widget.onSelectItem != null) {
          widget.onSelectItem!(value);
        }
      },
      items: <T>[...widget.items]
          .map<DropdownMenuItem<T>>(
            (T value) => DropdownMenuItem<T>(
              value: value,
              child: Center(
                child: Text(
                  widget.getTitle(value),
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontSize: 12),
                ),
              ),
            ),
          )
          .toList(),
    ),
  );
}
