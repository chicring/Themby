import 'package:flutter/material.dart';

class EmbyLibraryScreen extends StatefulWidget {
  const EmbyLibraryScreen({super.key, required this.parentId});
  final String title = '分类展示页面';
  final String parentId;
  @override
  _EmbyLibraryScreen createState() => _EmbyLibraryScreen();
}

class _EmbyLibraryScreen extends State<EmbyLibraryScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类展示页面'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: '分类1'),
            Tab(text: '分类2'),
            Tab(text: '分类3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('分类1的内容')),
          Center(child: Text('分类2的内容')),
          Center(child: Text('分类3的内容')),
        ],
      ),
    );
  }
}