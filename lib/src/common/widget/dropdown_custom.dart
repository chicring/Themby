import 'package:flutter/material.dart';

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
    return SizedBox(
      height: 40,
      child: DropdownMenu<String>(
        dropdownMenuEntries: _buildMenuList(widget.data),
        initialSelection: widget.initialSelection,
        onSelected: _onSelected,
      ),
    );
  }

  List<DropdownMenuEntry<String>> _buildMenuList(List<String> data) {
    return data.map((String value) {
      return DropdownMenuEntry<String>(value: value, label: value);
    }).toList();
  }
}