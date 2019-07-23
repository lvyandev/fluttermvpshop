import 'package:json_annotation/json_annotation.dart';

part 'base_bean.g.dart';

@JsonSerializable()
class BaseBean<T> {
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  T data;

  BaseBean({this.code, this.message, this.data});

  factory BaseBean.fromJson(Map<String, dynamic> json) =>
      _$BaseBeanFromJson<T>(json);

  Map<String, dynamic> toJson() => _$BaseBeanToJson(this);

  @override
  String toString() {
    return 'BaseBean{code: $code, message: $message, data: $data}';
  }
}

T _dataFromJson<T>(Map<String, dynamic> input) => input['data'] as T;

Map<String, dynamic> _dataToJson<T>(T input) => {'data': input};
