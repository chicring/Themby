import 'package:flutter/material.dart';



class SelectDialog<T> extends StatefulWidget{
  final T value;
  final String title;
  final List<dynamic> values;
  final int type;

  const SelectDialog({
    super.key,
    required this.value,
    required this.title,
    required this.values,
    required this.type,
  });

  @override
  _SelectDialogState<T> createState() => _SelectDialogState<T>();

}

class _SelectDialogState<T> extends State<SelectDialog<T>> {
  late T _tempValue;

  @override
  void initState() {
    super.initState();
    _tempValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = Theme.of(context).textTheme.titleMedium!;

    return AlertDialog(
      title: Text(widget.title),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
      content: StatefulBuilder(builder: (context, StateSetter setState) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.type == 0
                ? _buildTextOptions(setState, titleStyle)
                : _buildColorOptions(setState),
          ),
        );
      }),
    );
  }

  List<Widget> _buildTextOptions(StateSetter setState, TextStyle titleStyle) {
    return widget.values.map((i) {
      bool isSelected = _tempValue == i['value']; // 检查当前项是否选中
      return Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Theme.of(context).highlightColor : null, // 如果选中则改变背景色
        ),
        // color: isSelected ? Theme.of(context).highlightColor : null, // 如果选中则改变背景色
        child: ListTile(
          title: Text(i['title'], style: isSelected ? titleStyle.copyWith(fontWeight: FontWeight.bold) : titleStyle), // 如果选中，文字加粗
          onTap: () {
            setState(() {
              _tempValue = i['value'] as T;
              Navigator.pop(context, _tempValue); // 选中后关闭对话框，并返回选中的值
            });
          },
        ),
      );
    }).toList();
  }

  List<Widget> _buildColorOptions(StateSetter setState) {
    return widget.values.map((i) {
      bool isSelected = _tempValue == i['value']; // 检查当前项是否选中
      return InkWell(
        onTap: () {
          setState(() => _tempValue = i['value'] as T);
          Navigator.pop(context, _tempValue);
        },

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelected ? i['color'].withOpacity(0.5) : Colors.transparent, // 如果选中则改变背景色
          ),
          height: 36,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:  i['color'], // 如果选中则改变背景色
            ),
          ),
        ),
      );
    }).toList();
  }

}

