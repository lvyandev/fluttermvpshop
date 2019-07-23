// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseBean<T> _$BaseBeanFromJson<T>(Map<String, dynamic> json) {
  return BaseBean<T>(
    code: json['code'] as String,
    message: json['message'] as String,
    data: _dataFromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BaseBeanToJson<T>(BaseBean<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': _dataToJson(instance.data),
    };
