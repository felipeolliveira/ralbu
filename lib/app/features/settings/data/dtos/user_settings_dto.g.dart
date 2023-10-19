// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserSettingsDTOAdapter extends TypeAdapter<UserSettingsDTO> {
  @override
  final int typeId = 0;

  @override
  UserSettingsDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserSettingsDTO(
      retroAchievementsKey: fields[0] == null ? '' : fields[0] as String,
      username: fields[3] == null ? '' : fields[3] as String,
      systemColor: fields[1] == null ? 0 : fields[1] as int,
      theme: fields[2] == null ? 'dark' : fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserSettingsDTO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.retroAchievementsKey)
      ..writeByte(1)
      ..write(obj.systemColor)
      ..writeByte(2)
      ..write(obj.theme)
      ..writeByte(3)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSettingsDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
