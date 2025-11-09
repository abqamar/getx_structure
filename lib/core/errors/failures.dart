abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  final int? code;
  const ServerFailure(String message, {this.code}) : super(message);
}

class CacheFailure extends Failure { const CacheFailure(String m) : super(m); }
class NoInternetFailure extends Failure { const NoInternetFailure(String m) : super(m); }
class TimeoutFailure extends Failure { const TimeoutFailure(String m) : super(m); }
class UnknownFailure extends Failure { const UnknownFailure(String m) : super(m); }
