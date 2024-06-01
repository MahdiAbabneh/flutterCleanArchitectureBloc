import 'package:cached_network_image/cached_network_image.dart';
import 'package:error_handler_project/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AnimatedGridView extends StatefulWidget {
  final ScrollController scroll;
  final  cubit;
  final BuildContext context;

  const AnimatedGridView({
    super.key,
    required this.scroll,
    required this.cubit,
    required this.context,
  });

  @override
  _AnimatedGridViewState createState() => _AnimatedGridViewState();
}

class _AnimatedGridViewState extends State<AnimatedGridView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Transform.scale(
            scale: _animation.value,
            child: buildGridView(widget.scroll, widget.cubit, widget.context),
          ),
        );
      },
    );
  }

  Widget buildGridView(scroll, cubit, context) {
    return GridView.builder(
      controller: scroll,
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: responsive(context, 2, 3).toInt(),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 15.0,
        childAspectRatio: 1 / 1.50,
      ),
      itemCount: cubit.photos.length,
      itemBuilder: (context, index) {
        // Applying additional animations to each grid item
        return FadeTransition(
          opacity: _animation,
          child: ScaleTransition(
            scale: _animation,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: CachedNetworkImage(
                imageUrl: cubit.photos[index].src.portrait,
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator(backgroundColor: Colors.grey,)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        );
      },
    );
  }
}