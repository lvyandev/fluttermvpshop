import 'package:json_annotation/json_annotation.dart';

part 'comment_bean.g.dart';

@JsonSerializable()
class CommentBean {
  @JsonKey(name: 'SCORE')
  int score;

  @JsonKey(name: 'comments')
  String comments;

  @JsonKey(name: 'discussTime')
  int discussTime;

  @JsonKey(name: 'userName')
  String userName;

  CommentBean(this.score, this.comments, this.discussTime, this.userName);

  factory CommentBean.fromJson(Map<String, dynamic> srcJson) =>
      _$CommentBeanFromJson(srcJson);
}
