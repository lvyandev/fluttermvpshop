import 'package:flutter_mvp_shop/model/entity/detail/product_detail_bean.dart';
import 'package:flutter_mvp_shop/model/entity/home/home_bean.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_bean.g.dart';

@JsonSerializable()
class BaseBean<T> {
  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data')
  @_JsonConverter()
  final T data;

  BaseBean({this.code, this.message, this.data});

  factory BaseBean.fromJson(Map<String, dynamic> json) =>
      _$BaseBeanFromJson<T>(json);

  Map<String, dynamic> toJson() => _$BaseBeanToJson(this);

  @override
  String toString() {
    return 'BaseBean{code: $code, message: $message, data: $data}';
  }
}

class _JsonConverter<T> implements JsonConverter<T, Object> {
  const _JsonConverter();

  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('recommend')) {
        return HomeBean.fromJson(json) as T;
      } else if (json.containsKey('goodInfo')) {
        return ProductDetailBean.fromJson(json) as T;
      }
    }
    return json as T;
  }

  @override
  Object toJson(T object) {
    return object;
  }
}
