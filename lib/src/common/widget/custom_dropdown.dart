
import 'package:flutter/material.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/domiani/Select.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    required this.hint,
    required this.dropdownItems,
    required this.onChanged,
    this.dropdownHeight,
    this.buttonMaxWidth,
    super.key,
  });
  final String hint;
  final List<Select> dropdownItems;
  final ValueChanged<int?>? onChanged;
  final double? dropdownHeight;
  final double? buttonMaxWidth;


  @override
  Widget build(BuildContext context) {

    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: StyleString.mdRadius,
      borderSide: const BorderSide(color: Colors.transparent),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hint.isNotEmpty) ...[
          Text(hint, style: StyleString.subtitleStyle),
          const SizedBox(width: 10),
        ],
        Expanded(
          child: DropdownMenu<int>(
            trailingIcon: const SizedBox.shrink(),
            selectedTrailingIcon: const SizedBox.shrink(),
            textStyle: TextStyle(fontSize: 12.0, color: Theme.of(context).colorScheme.onSurface),
            inputDecorationTheme: InputDecorationTheme(
              border: border,
              focusedBorder: border,
              enabledBorder: border,
              disabledBorder: border,
              filled:  dropdownItems.length > 1,
              fillColor: Theme.of(context).colorScheme.surfaceContainer,
              constraints: BoxConstraints(
                minHeight: 26.0,
                maxHeight: 26.0,
                maxWidth: buttonMaxWidth ?? double.infinity,
              ),
              contentPadding: const EdgeInsets.only(left: 12.0),
            ),
            menuHeight: dropdownHeight ?? 300,
            menuStyle:  MenuStyle(
              shape: const WidgetStatePropertyAll<ContinuousRectangleBorder>(ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18)))),
              backgroundColor: WidgetStatePropertyAll<Color>(Theme.of(context).colorScheme.surface),
              surfaceTintColor: WidgetStatePropertyAll<Color>(Theme.of(context).colorScheme.surface),
              padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 12,horizontal: 8)),
            ),
            dropdownMenuEntries: _buildMenuList(dropdownItems),
            initialSelection: 0,
            onSelected: onChanged,
            enabled: dropdownItems.length > 1,
          ),
        )

      ],
    );
  }

  List<DropdownMenuEntry<int>> _buildMenuList(List<Select> data) {
    return data.map((Select s) {
      return DropdownMenuEntry<int>(
          value: int.parse(s.value),
          label: s.title,
          labelWidget: SizedBox(
            width: buttonMaxWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(s.title,maxLines: 1, style: const TextStyle(fontSize: 12.0), overflow:TextOverflow.ellipsis,),
                s.subtitle == null
                    ? const SizedBox()
                    : Text(s.subtitle!,maxLines: 1, style: const TextStyle(fontSize: 11.0,color: Colors.grey), overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          style: const ButtonStyle(
            shape: WidgetStatePropertyAll<ContinuousRectangleBorder>(ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18)))),
          )
      );
    }).toList();
  }
}

