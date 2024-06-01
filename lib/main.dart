import 'dart:async';
import 'package:error_handler_project/presentation/bloc/cubit.dart';
import 'package:error_handler_project/presentation/bloc/states.dart';
import 'package:error_handler_project/presentation/pages/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import 'core/network/error/error_logger.dart';
import 'injection.dart' as di;
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = AppBlocObserver();
  registerErrorHandlers(sl<ErrorLogger>());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                di.sl<HomeCubit>()..getDataImages())
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              builder: (context, widget) {
                Widget error = const Text('...rendering error...');
                if (widget is Scaffold || widget is Navigator) {
                  error = Scaffold(body: Center(child: error));
                }
                ErrorWidget.builder = (errorDetails) => error;
                if (widget != null) return widget;
                throw StateError('widget is null');
              },
              home: const SplashScreen());
        },
      ),
    );
  }
}

void registerErrorHandlers(ErrorLogger errorLogger) {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
  };
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
    return true;
  };
}
