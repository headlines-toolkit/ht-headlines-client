// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Headline _$HeadlineFromJson(Map<String, dynamic> json) => Headline(
  title: json['title'] as String,
  description: json['description'] as String?,
  url: json['url'] as String?,
  imageUrl: json['imageUrl'] as String?,
  publishedAt:
      json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
  source:
      json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
  category:
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
  eventCountry:
      json['event_country'] == null
          ? null
          : Country.fromJson(json['event_country'] as Map<String, dynamic>),
  id: json['id'] as String?,
);

Map<String, dynamic> _$HeadlineToJson(Headline instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'url': instance.url,
  'imageUrl': instance.imageUrl,
  'publishedAt': instance.publishedAt?.toIso8601String(),
  'source': instance.source?.toJson(),
  'category': instance.category?.toJson(),
  'event_country': instance.eventCountry?.toJson(),
};
