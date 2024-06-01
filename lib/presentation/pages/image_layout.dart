import 'package:error_handler_project/presentation/bloc/cubit.dart';
import 'package:error_handler_project/presentation/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'animatedGrid.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final ScrollController _scrollController = ScrollController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _loadImages();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadImages();
    }
  }

  void _loadImages() {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
      context.read<HomeCubit>().getMoreImages().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state is WallpaperGetDataLoading
              ? const Center(child: CircularProgressIndicator( backgroundColor: Colors.grey,))
              : state is WallpaperGetDataSuccess
                  ? Column(
                      children: [
                        Expanded(
                            child: AnimatedGridView(
                          scroll: _scrollController,
                          cubit: state.image,
                          context: context,
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        if (_isLoading)
                          const Column(
                            children: [
                              Center(
                                  child: CircularProgressIndicator(
                                backgroundColor: Colors.grey,
                              )),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "😎 Load New Wallpapers 😎",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  : const Text("Something went wrong"),
        );
      },
    );
  }
}
