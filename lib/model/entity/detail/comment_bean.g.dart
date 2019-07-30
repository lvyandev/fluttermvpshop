// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentBean _$CommentBeanFromJson(Map<String, dynamic> json) {
  return CommentBean(
    json['SCORE'] as int,
    json['comments'] as String,
    json['discussTime'] as int,
    json['userName'] as String,
  );
}

Map<String, dynamic> _$CommentBeanToJson(CommentBean instance) =>
    <String, dynamic>{
      'SCORE': instance.score,
      'comments': instance.comments,
      'discussTime': instance.discussTime,
      'userName': instance.userName,
    };
