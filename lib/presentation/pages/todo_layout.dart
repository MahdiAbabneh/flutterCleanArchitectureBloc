import 'package:error_handler_project/presentation/bloc/cubit.dart';
import 'package:error_handler_project/presentation/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoLayout extends StatefulWidget {
  const TodoLayout({
    super.key,
  });

  @override
  State<TodoLayout> createState() => _TodoLayoutState();
}

class _TodoLayoutState extends State<TodoLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
      if (state is TodoDeleteSuccess) {
        HomeCubit.get(context).hasLoading = false;
        Navigator.of(context).pop();
        HomeCubit.get(context).getDataTodo();
      }
    }, builder: (context, state) {
      return Scaffold(
        body: state is TodoGetDataSuccess
            ? ListView.builder(
                itemCount: state.todo.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SizedBox(
                                height: 50,
                                child: Column(
                                  children: [
                                    HomeCubit.get(context).hasLoading
                                        ? const CircularProgressIndicator(
                                            backgroundColor: Colors.grey,
                                          )
                                        : Row(
                                            children: [
                                              const Spacer(),
                                              TextButton(
                                                child: const Text('No'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: const Text('Yes'),
                                                onPressed: () {
                                                  HomeCubit.get(context)
                                                      .deleteTodo(state
                                                          .todo[index].id!);
                                                },
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                              title: const Text('Delete Todo'),
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    title: Column(
                      children: [
                        Text(state.todo[index].title),
                        const Divider()
                      ],
                    ),
                    leading: state.todo[index].completed
                        ? const Icon(
                            Icons.waving_hand_rounded,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.waving_hand_rounded,
                            color: Colors.grey,
                          ),
                    onTap: () {},
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                ),
              ),
      );
    });
  }
}
