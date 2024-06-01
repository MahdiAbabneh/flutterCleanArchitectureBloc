import 'package:error_handler_project/domain/repositories/repo_Image.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;


@GenerateMocks(
  [
    ImagesRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)

void main() {}