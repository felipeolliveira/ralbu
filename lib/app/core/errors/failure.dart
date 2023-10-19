import 'package:equatable/equatable.dart';

abstract class Failure {}

class RemoteFailure extends Failure with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class LocalFailure extends Failure with EquatableMixin {
  @override
  List<Object?> get props => [];
}
