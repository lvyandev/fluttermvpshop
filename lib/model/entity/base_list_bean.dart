import 'package:flutter_mvp_shop/model/entity/product_bean.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_list_bean.g.dart';

@JsonSerializable(anyMap: true)
class BaseListBean<T> {
  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data', )
  @_JsonConverter()
  final List<T> data;

  BaseListBean({this.code, this.message, this.data});

  factory BaseListBean.fromJson(Map<String, dynamic> json) =>
      _$BaseListBeanFromJson<T>(json);

  Map<String, dynamic> toJson() => _$BaseListBeanToJson(this);

  @override
  String toString() {
    return 'BaseListBean{code: $code, message: $message, data: $data}';
  }
}

class _JsonConverter<T> implements JsonConverter<T, Object> {
  const _JsonConverter();

  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic> &&
        json.containsKey('mallPrice') &&
        json.containsKey('goodsName')) {
      return ProductBean.fromJson(json) as T;
    }
    return json as T;
  }

  @override
  Object toJson(T object) {
    return object;
  }
}
