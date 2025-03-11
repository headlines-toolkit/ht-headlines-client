import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'headline.g.dart';

/// {@template headline}
/// Headline model
///
/// Represents a news headline item.
/// {@endtemplate}
@JsonSerializable()
class Headline extends Equatable {
  /// {@macro headline}
  const Headline({
    required this.id,
    required this.title,
    this.description,
    this.url,
    this.imageUrl,
    this.publishedAt,
    this.source,
    this.categories,
    this.eventCountry,
  });

  /// Factory method to create a [Headline] instance from a JSON map.
  factory Headline.fromJson(Map<String, dynamic> json) =>
      _$HeadlineFromJson(json);

  /// Unique identifier for the headline.
  final String id;

  /// Title of the headline.
  final String title;

  /// Description or snippet of the headline content.
  final String? description;

  /// URL to the full article or content.
  final String? url;

  /// URL to an image associated with the headline.
  final String? imageUrl;

  /// Date and time when the headline was published.
  final DateTime? publishedAt;

  /// Source or origin of the headline.
  final String? source;

  /// categories of the current headline
  final List<String>? categories;

  /// the country where the event has took place;
  final String? eventCountry;

  /// Converts this [Headline] instance to a JSON map.
  Map<String, dynamic> toJson() => _$HeadlineToJson(this);

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    url,
    imageUrl,
    publishedAt,
    source,
    categories,
    eventCountry,
  ];

  /// Creates a new [Headline] with updated properties.
  /// Use this to modify a [Headline] without changing the original instance.
  Headline copyWith({
    String? id,
    String? title,
    String? description,
    String? url,
    String? imageUrl,
    DateTime? publishedAt,
    String? source,
    List<String>? categories,
    String? eventCountry,
  }) {
    return Headline(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      publishedAt: publishedAt ?? this.publishedAt,
      source: source ?? this.source,
      categories: categories ?? this.categories,
      eventCountry: eventCountry ?? this.eventCountry,
    );
  }
}
