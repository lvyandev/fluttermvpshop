// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseBean<T> _$BaseBeanFromJson<T>(Map<String, dynamic> json) {
  return BaseBean<T>(
    code: json['code'] as String,
    message: json['message'] as String,
    data: _JsonConverter<T>().fromJson(json['data']),
  );
}

Map<String, dynamic> _$BaseBeanToJson<T>(BaseBean<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': _JsonConverter<T>().toJson(instance.data),
    };
