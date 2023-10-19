import '../../../../core/dtos/dto.dart';
import '../../../achievements_panel/domain/entities/console_entity.dart';

class ConsoleDTO implements DTO<ConsoleEntity> {
  final int id;
  final String name;

  ConsoleDTO({required this.id, required this.name});

  @override
  ConsoleEntity toDomain() {
    return ConsoleEntity(id: id, name: name);
  }

  factory ConsoleDTO.fromMap(Map<String, dynamic> map) {
    return ConsoleDTO(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}
