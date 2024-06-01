import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

int responsive(context, mobile, tab) {
  return MediaQuery.of(context).size.height < 430 ||
          MediaQuery.of(context).size.width < 490
      ? mobile
      : tab;
}

SnackBar? showToastSuccess(msg, context) {
  final snackBar = SnackBar(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
    ),
    padding: const EdgeInsets.only(bottom: 40, top: 10),
    dismissDirection: DismissDirection.up,
    duration: const Duration(seconds: 3),
    content: Center(
      child: Text(
        msg,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: responsive(context, 16.0, 24.0).toDouble()),
      ),
    ),
    backgroundColor: Theme.of(context).primaryColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  return null;
}

SnackBar? showToastFailed(msg, context) {
  final snackBar = SnackBar(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
    ),
    padding: const EdgeInsets.only(bottom: 40, top: 10),
    dismissDirection: DismissDirection.up,
    duration: const Duration(seconds: 3),
    content: Center(
      child: Text(
        msg,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: responsive(context, 16.0, 24.0).toDouble()),
      ),
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  return null;
}

Widget defaultFormField(
    {required TextEditingController controller,
    TextInputType? type,
    VoidCallback? onPressed,
    String? Function(String?)? onChange,
    String? Function(String?)? onSubmit,
    VoidCallback? onTab,
    String? Function(String?)? validator,
    required String label,
    bool isPassword = false,
    bool isClickable = true,
    required IconData prefixIcon,
    IconData? suffixIcon,
    VoidCallback? suffixPressed}) {
  return TextFormField(
    onTap: onTab,
    controller: controller,
    validator: validator,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    enabled: isClickable,
    keyboardType: type,
    obscureText: isPassword == true ? true : false,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefixIcon),
      suffixIcon: suffixIcon != null
          ? IconButton(
              icon: Icon(suffixIcon),
              onPressed: suffixPressed,
            )
          : null,
      border: const OutlineInputBorder(),
    ),
  );
}

Widget buildGridView(scroll,cubit, context) {
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
      return ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: CachedNetworkImage(
          imageUrl: cubit.photos[index].src.portrait,
          placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
          const Icon(Icons.error),
        ),
      );
    },
  );
}

