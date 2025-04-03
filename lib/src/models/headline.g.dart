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
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
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
  'categories': instance.categories?.map((e) => e.toJson()).toList(),
  'event_country': instance.eventCountry?.toJson(),
};
