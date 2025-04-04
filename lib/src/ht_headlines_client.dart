import 'package:ht_categories_client/ht_categories_client.dart';
import 'package:ht_countries_client/ht_countries_client.dart';
import 'package:ht_headlines_client/src/models/headline.dart';
import 'package:ht_sources_client/ht_sources_client.dart';

/// {@template headlines_exception}
/// Base class for all custom exceptions in the ht_headlines_client.
/// {@endtemplate}
abstract class HeadlinesException implements Exception {
  /// {@macro headlines_exception}
  const HeadlinesException(this.message);

  /// Human-readable message describing the exception.
  final String message;
}

/// {@template headlines_fetch_exception}
/// Exception thrown when there is an issue fetching headlines.
/// {@endtemplate}
class HeadlinesFetchException extends HeadlinesException {
  /// {@macro headlines_fetch_exception}
  const HeadlinesFetchException(super.message);
}

/// {@template headline_not_found_exception}
/// Exception thrown when a specific headline is not found.
/// {@endtemplate}
class HeadlineNotFoundException extends HeadlinesException {
  /// {@macro headline_not_found_exception}
  const HeadlineNotFoundException(super.message);
}

/// {@template headline_create_exception}
/// Exception thrown when there is an issue creating a headline.
/// {@endtemplate}
class HeadlineCreateException extends HeadlinesException {
  /// {@macro headline_create_exception}
  const HeadlineCreateException(super.message);
}

/// {@template headline_update_exception}
/// Exception thrown when there is an issue updating a headline.
/// {@endtemplate}
class HeadlineUpdateException extends HeadlinesException {
  /// {@macro headline_update_exception}
  const HeadlineUpdateException(super.message);
}

/// {@template headline_delete_exception}
/// Exception thrown when there is an issue deleting a headline.
/// {@endtemplate}
class HeadlineDeleteException extends HeadlinesException {
  /// {@macro headline_delete_exception}
  const HeadlineDeleteException(super.message);
}

/// {@template headlines_search_exception}
/// Exception thrown when there is an issue searching for headlines.
/// {@endtemplate}
class HeadlinesSearchException extends HeadlinesException {
  /// {@macro headlines_search_exception}
  const HeadlinesSearchException(super.message);
}

/// {@template ht_headlines_client}
/// Abstract client for fetching news headlines.
///
/// This client is designed to be adaptable to various data sources,
/// including but not limited to Firebase Firestore. Implementations
/// should handle data fetching, caching, and error management as needed.
/// {@endtemplate}
abstract class HtHeadlinesClient {
  /// {@macro ht_headlines_client}
  const HtHeadlinesClient();

  /// Fetches a list of headlines, optionally filtering by various criteria.
  ///
  /// [limit] - The maximum number of headlines to return.
  /// [startAfterId] - The ID of the headline to start after (for pagination).
  /// [categories] - Optional list of [Category] objects. If provided, returns
  ///   headlines whose single category matches *any* of the categories in this
  ///   list (OR logic).
  /// [sources] - Optional list of [Source] objects. If provided, returns
  ///   headlines whose single source matches *any* of the sources in this
  ///   list (OR logic).
  /// [eventCountries] - Optional list of [Country] objects. If provided,
  ///   returns headlines whose single event country matches *any* of the
  ///   countries in this list (OR logic).
  ///
  /// Note: Filtering logic across different parameter types
  /// (e.g., categories AND sources)
  ///
  /// depends on the specific implementation, but typically acts
  /// as an AND condition.
  ///
  /// Returns a [Future] that resolves to a list of [Headline] objects.
  /// Throws [HeadlinesFetchException] if the headlines cannot be fetched.
  Future<List<Headline>> getHeadlines({
    int? limit,
    String? startAfterId,
    List<Category>? categories,
    List<Source>? sources,
    List<Country>? eventCountries,
  });

  /// Fetches a specific headline by its unique identifier.
  ///
  /// Returns a [Future] that resolves to a [Headline] object if found.
  /// Returns `null` if no headline with the given [id] exists.
  /// Throws [HeadlineNotFoundException if no headline with given [id] exists.
  /// Throws [HeadlinesFetchException] if there is an issue fetching headline.
  Future<Headline?> getHeadline({required String id});

  /// Creates a new headline.
  ///
  /// Implementations should handle data validation and persistence.
  ///
  /// Returns a [Future] that resolves to the created [Headline] object.
  /// Throws [HeadlineCreateException] if the headline cannot be created.
  Future<Headline> createHeadline({required Headline headline});

  /// Updates an existing headline.
  ///
  /// Implementations should handle data validation and persistence.
  ///
  /// Returns a [Future] that resolves to the updated [Headline] object.
  /// Throws [HeadlineUpdateException] if the headline cannot be updated.
  Future<Headline> updateHeadline({required Headline headline});

  /// Deletes a headline by its unique identifier.
  ///
  /// Returns a [Future] that completes when the headline is
  /// successfully deleted.
  ///
  /// Throws [HeadlineDeleteException] if the headline cannot be deleted.
  Future<void> deleteHeadline({required String id});

  /// Performs a search for headlines based on a query string.
  ///
  /// Implementations should handle different search strategies
  /// and relevance ranking.
  ///
  /// Returns a [Future] that resolves to a list of [Headline] objects
  /// that match the search query.
  /// Throws [HeadlinesSearchException] if the search cannot be performed.
  ///
  /// [limit] - The maximum number of headlines to return.
  /// [startAfterId] - The ID of the headline to start after (for pagination).
  Future<List<Headline>> searchHeadlines({
    required String query,
    int? limit,
    String? startAfterId,
  });
}
