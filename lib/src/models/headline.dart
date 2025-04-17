import 'package:equatable/equatable.dart';
import 'package:ht_categories_client/ht_categories_client.dart';
import 'package:ht_sources_client/ht_sources_client.dart';
import 'package:uuid/uuid.dart';

/// {@template headline}
/// Headline model
///
/// Represents a news headline item.
/// {@endtemplate}
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
    String? id,
  }) : id = id ?? const Uuid().v4();

  /// Factory method to create a [Headline] instance from a JSON map.
  factory Headline.fromJson(Map<String, dynamic> json) {
    return Headline(
      id: json['id'] as String?, // Use existing ID if present
      title: json['title'] as String,
      description: json['description'] as String?,
      url: json['url'] as String?,
      imageUrl: json['imageUrl'] as String?,
      publishedAt:
          json['publishedAt'] == null
              ? null
              : DateTime.tryParse(json['publishedAt'] as String),
      source:
          json['source'] == null
              ? null
              : Source.fromJson(json['source'] as Map<String, dynamic>),
      category:
          json['category'] == null
              ? null
              : Category.fromJson(json['category'] as Map<String, dynamic>),
    );
  }

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
  final Source? source;

  /// Category of the current headline.
  final Category? category;

  /// Converts this [Headline] instance to a JSON map.
  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{'id': id, 'title': title};
    if (description != null) {
      json['description'] = description;
    }
    if (url != null) {
      json['url'] = url;
    }
    if (imageUrl != null) {
      json['imageUrl'] = imageUrl;
    }
    if (publishedAt != null) {
      json['publishedAt'] = publishedAt!.toIso8601String();
    }
    if (source != null) {
      json['source'] = source!.toJson(); // Assumes Source has toJson
    }
    if (category != null) {
      json['category'] = category!.toJson(); // Assumes Category has toJson
    }
    return json;
  }

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
    );
  }
}
