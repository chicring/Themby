import 'package:flutter/material.dart';
import 'package:themby/src/common/constants.dart';
import 'package:themby/src/common/domiani/Select.dart';

class DropdownMenuCustom extends StatefulWidget {
  const DropdownMenuCustom({
    super.key,
    required this.data,
    required this.initialSelection, required this.onSelected,
  });

  final List<Select> data;
  final int initialSelection;

  final ValueChanged<int> onSelected;

  @override
  State<DropdownMenuCustom> createState() => _DropdownMenuCustomState();
}

class _DropdownMenuCustomState extends State<DropdownMenuCustom> {

  late int _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialSelection;
  }

  void _onSelected(int? value) {
    setState(() {
      _selectedValue = value!;
    });
    widget.onSelected(value!);
  }

  @override
  Widget build(BuildContext context) {

    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: StyleString.mdRadius,
      borderSide: const BorderSide(color: Colors.transparent),
    );

    ThemeData theme = Theme.of(context);
    Color? fillColor = theme.brightness == Brightness.dark
        ? Colors.grey[800]
        : Colors.grey[200];

    return DropdownMenu<int>(
      width: 250,
      trailingIcon: Transform.translate(
        offset: const Offset(6, -10),
        child: const Icon(Icons.arrow_drop_down),
      ),
      textStyle: const TextStyle(fontSize: 12.0),
      inputDecorationTheme: InputDecorationTheme(
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        filled: true,
        fillColor: fillColor,
        constraints: const BoxConstraints.tightFor(height: 26.0),
        contentPadding: const EdgeInsets.only(left: 12.0),
      ),
      menuHeight: 300,
      menuStyle: const MenuStyle(
        shape: WidgetStatePropertyAll<ContinuousRectangleBorder>(ContinuousRectangleBorder()),
      ),
      dropdownMenuEntries: _buildMenuList(widget.data),
      initialSelection: widget.initialSelection,
      onSelected: _onSelected,
      enabled: widget.data.length > 1,
    );
  }

  List<DropdownMenuEntry<int>> _buildMenuList(List<Select> data) {
    return data.map((Select s) {
      return DropdownMenuEntry<int>(
          value: int.parse(s.value),
          label: s.title,
          labelWidget: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(s.title,maxLines: 1, style: const TextStyle(fontSize: 12.0)),
                s.subtitle == null
                    ? const SizedBox()
                    : Text(s.subtitle!, style: const TextStyle(fontSize: 10.0))
              ],
            ),
          )
      );
    }).toList();
  }
}