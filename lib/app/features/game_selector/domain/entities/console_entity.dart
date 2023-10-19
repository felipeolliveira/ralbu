import 'package:equatable/equatable.dart';

class ConsoleEntity extends Equatable {
  final String id;
  final String name;

  const ConsoleEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
