import 'package:equatable/equatable.dart';
import 'package:ht_categories_client/ht_categories_client.dart';
import 'package:ht_countries_client/ht_countries_client.dart';
import 'package:ht_sources_client/ht_sources_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'headline.g.dart';

/// {@template headline}
/// Headline model
///
/// Represents a news headline item.
/// {@endtemplate}
@JsonSerializable(
  explicitToJson: true,
) // explicitToJson needed for nested objects
class Headline extends Equatable {
  /// {@macro headline}
  Headline({
    required this.title,
    this.description,
    this.url,
    this.imageUrl,
    this.publishedAt,
    this.source,
    this.category,
    this.eventCountry,
    String? id,
  }) : id = id ?? const Uuid().v4();

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
  @JsonKey(name: 'source')
  final Source? source;

  /// Category of the current headline.
  @JsonKey(name: 'category')
  final Category? category;

  /// The country where the event took place.
  @JsonKey(name: 'event_country')
  final Country? eventCountry;

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
    category,
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
    Source? source,
    Category? category,
    Country? eventCountry,
  }) {
    return Headline(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      publishedAt: publishedAt ?? this.publishedAt,
      source: source ?? this.source,
      category: category ?? this.category,
      eventCountry: eventCountry ?? this.eventCountry,
    );
  }
}
