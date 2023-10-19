import 'package:fpdart/fpdart.dart';

import '../errors/failure.dart';

abstract class UseCase<TReturn, TParams extends dynamic> {
  Future<Either<Failure, TReturn>> call(TParams params);
}
