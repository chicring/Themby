import 'package:flutter/material.dart';
import 'package:themby/src/common/constants.dart';

class DropdownMenuCustom extends StatefulWidget {
  const DropdownMenuCustom({
    super.key,
    required this.data,
    required this.initialSelection, required this.onSelected,
  });

  final List<String> data;
  final String initialSelection;

  final ValueChanged<String> onSelected;

  @override
  State<DropdownMenuCustom> createState() => _DropdownMenuCustomState();
}

class _DropdownMenuCustomState extends State<DropdownMenuCustom> {

  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialSelection;
  }

  void _onSelected(String? value) {
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

    return SizedBox(
      child: DropdownMenu<String>(
        trailingIcon: Transform.translate(
          offset: const Offset(6, -10),
          child: const Icon(Icons.arrow_drop_down),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: border,
          focusedBorder: border,
          enabledBorder: border,
          filled: true,
          fillColor: fillColor,
          constraints: BoxConstraints.tight(const Size.fromHeight(26.0)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        ),
        dropdownMenuEntries: _buildMenuList(widget.data),
        initialSelection: widget.initialSelection,
        onSelected: _onSelected,
        enabled: widget.data.length > 1,
      ),
    );
  }

  List<DropdownMenuEntry<String>> _buildMenuList(List<String> data) {
    return data.map((String value) {
      return DropdownMenuEntry<String>(value: value, label: value);
    }).toList();
  }
}