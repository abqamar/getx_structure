import 'failures.dart';
import 'exceptions.dart';

Failure mapException(Object e) {
  if (e is NoInternetException) return NoInternetFailure(e.message ?? 'No internet');
  if (e is TimeoutExceptionEx)  return TimeoutFailure(e.message ?? 'Request timed out');
  if (e is ServerException)     return ServerFailure(e.message ?? 'Server error', code: e.code);
  if (e is CacheException)      return CacheFailure(e.message ?? 'Cache error');
  return UnknownFailure('Something went wrong');
}
