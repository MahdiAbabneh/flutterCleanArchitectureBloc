import 'package:bloc_test/bloc_test.dart';
import 'package:error_handler_project/presentation/bloc/cubit.dart';
import 'package:error_handler_project/presentation/bloc/states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:error_handler_project/injection.dart';


void main() async{

  setUp(() async {
    await init();

  });
  group("HomeCubit loading !", () {
    blocTest<HomeCubit, HomeStates>(
      "getImages function",
      build: () => sl<HomeCubit>(),
      act: (cubit)  async {
      await cubit.getDataImages();
      },
      expect: () =>
      [
        isA<WallpaperGetDataLoading>(),
        isA<WallpaperGetDataSuccess>(),
      ],
    );

  });
}
