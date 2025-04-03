# ht_headlines_client

Abstract client for fetching news headlines.

This client is designed to be adaptable to various data sources,
including but not limited to Firebase Firestore. Implementations
should handle data fetching, caching, and error management as needed.

## Features

* **Abstract Client:** Defines an abstract `HtHeadlinesClient` class that specifies the interface for interacting with news headline data.
* **Headline Model:** Includes a `Headline` model to represent news headline data with fields like `id`, `title`, `description`, `url`, `imageUrl`, `publishedAt`. It utilizes models from related packages for complex fields:
    *   `source`: A `Source` object (from `ht_sources_client`) representing the news source.
    *   `categories`: A list of `Category` objects (from `ht_categories_client`) the headline belongs to.
    *   `eventCountry`: A `Country` object (from `ht_countries_client`) indicating the location of the event described in the headline.
* **Exception Handling:** Defines a set of custom exceptions for robust error handling when fetching or manipulating headline data:
    *   `HeadlinesException`: Base class for all custom exceptions.
    *   `HeadlinesFetchException`: Thrown when there is an issue fetching headlines.
    *   `HeadlineNotFoundException`: Thrown when a specific headline is not found.
    *   `HeadlineCreateException`: Thrown when there is an issue creating a headline.
    *   `HeadlineUpdateException`: Thrown when there is an issue updating a headline.
    *   `HeadlineDeleteException`: Thrown when there is an issue deleting a headline.
    *   `HeadlinesSearchException`: Thrown when there is an issue searching for headlines.
* **Flexibility:** Designed to be adaptable to various data sources and backend implementations.
* **Data Model:** Uses `json_annotation` and `equatable` for easy serialization/deserialization and value equality of the `Headline` model.

## Methods

The `HtHeadlinesClient` class provides the following methods:

*   `getHeadlines`: Fetches a list of headlines.
    *   Parameters: `limit`, `startAfterId`, `category`, `source`, `eventCountry`.
    *   Returns: `Future<List<Headline>>`.
    *   Throws: `HeadlinesFetchException`.
*   `getHeadline`: Fetches a specific headline by its unique identifier.
    *   Parameters: `id`.
    *   Returns: `Future<Headline?>`.
    *   Throws: `HeadlineNotFoundException`, `HeadlinesFetchException`.
*   `createHeadline`: Creates a new headline.
    *    Parameters: `headline`.
    *    Returns: `Future<Headline>`.
    *    Throws: `HeadlineCreateException`.
*   `updateHeadline`: Updates an existing headline.
    *    Parameters: `headline`.
    *    Returns: `Future<Headline>`.
    *    Throws: `HeadlineUpdateException`.
*   `deleteHeadline`: Deletes a headline by its unique identifier.
    *    Parameters: `id`.
    *    Returns: `Future<void>`.
    *    Throws: `HeadlineDeleteException`.
*   `searchHeadlines`: Performs a search for headlines based on a query string.
    *    Parameters: `query`.
    *    Returns: `Future<List<Headline>>`.
    *    Throws: `HeadlinesSearchException`.

## Getting started

To use this package, add `ht_headlines_client` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  ht_headlines_client:
    git:
        url: https://github.com/headlines-toolkit/ht-headlines-client.git
        ref: main
```
