import 'package:error_handler_project/presentation/bloc/cubit.dart';
import 'package:error_handler_project/presentation/pages/todo_layout.dart';
import 'package:flutter/material.dart';

import 'image_layout.dart';

class CombinedScreen extends StatelessWidget {
  const CombinedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Clean Architecture App'),
          bottom: TabBar(
            onTap: (int index) {
              if (index == 1) {
                HomeCubit.get(context).getDataTodo();
              } else {
                HomeCubit.get(context).getDataImages();
              }
            },
            tabs: const [
              Tab(text: 'Wallpaper'),
              Tab(text: 'Todo'),
            ],
          ),
        ),
        body:  const TabBarView(
          children: [
            HomeLayout(),
            TodoLayout(), // Use TodoLayout here
          ],
        ),
      ),
    );
  }
}
