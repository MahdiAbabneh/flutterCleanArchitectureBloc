import 'package:error_handler_project/core/network/error/failures.dart';
import 'package:flutter/cupertino.dart';
TextEditingController searchPhotosController = TextEditingController();

class JosKeys {
  static final formKeyForSearchPhotos = GlobalKey<FormState>();
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case const (ServerFailure):
      return SERVER_FAILURE_MESSAGE;
    default:
      return "Unexpected Error , Please try again later .";
  }
}

const String SERVER_FAILURE_MESSAGE = 'Please try again later .';
const String EMPTY_CACHE_FAILURE_MESSAGE = 'No Data';
const String OFFLINE_FAILURE_MESSAGE = 'Please Check your Internet Connection';


int numOFImages=6;