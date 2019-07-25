// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_list_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListBean<T> _$BaseListBeanFromJson<T>(Map<String, dynamic> json) {
  return BaseListBean<T>(
    code: json['code'] as String,
    message: json['message'] as String,
    data: (json['data'] as List)?.map(_JsonConverter<T>().fromJson)?.toList(),
  );
}

Map<String, dynamic> _$BaseListBeanToJson<T>(BaseListBean<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data?.map(_JsonConverter<T>().toJson)?.toList(),
    };
