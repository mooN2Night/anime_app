import 'package:anime_app/core/constants/string_constant.dart';
import 'package:anime_app/core/error/failure.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure _:
      return StringConstants.serverFailure;
    case CacheFailure _:
      return StringConstants.cacheFailure;
    default:
      return StringConstants.unexpectedFailure;
  }
}