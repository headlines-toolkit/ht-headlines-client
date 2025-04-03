import 'package:ht_categories_client/ht_categories_client.dart';
import 'package:ht_countries_client/ht_countries_client.dart';
import 'package:ht_headlines_client/src/models/headline.dart';
import 'package:ht_sources_client/ht_sources_client.dart';
import 'package:test/test.dart';

void main() {
  // Sample data for nested models
  final sampleSource = Source(id: 'src-1', name: 'Test Source');
  final sampleCategory1 = Category(id: 'cat-1', name: 'business');
  final sampleCategory2 = Category(id: 'cat-2', name: 'tech');
  final sampleCountry = Country(
    id: 'ctry-1',
    isoCode: 'US',
    name: 'United States',
    flagUrl: 'url/to/us/flag.png',
  );
  final sampleCategories = [sampleCategory1, sampleCategory2];

  group('Headline', () {
    test('constructor', () {
      final headline = Headline(id: '1', title: 'Test Headline');
      expect(headline.id, '1');
      expect(headline.title, 'Test Headline');
      expect(headline.description, null);
      expect(headline.url, null);
      expect(headline.imageUrl, null);
      expect(headline.publishedAt, null);
      expect(headline.source, isNull);
      expect(headline.categories, isNull);
      expect(headline.eventCountry, isNull);
    });

    test('fromJson', () {
      final json = <String, dynamic>{
        'id': '2',
        'title': 'Headline from Json',
        'description': 'Description from Json',
        'url': 'https://example.com',
        'imageUrl': 'https://example.com/image.png',
        'publishedAt': '2024-03-07T12:00:00Z',
        'source': sampleSource.toJson(),
        'categories': sampleCategories.map((c) => c.toJson()).toList(),
        'event_country': sampleCountry.toJson(), // Note: key is event_country
      };
      final headline = Headline.fromJson(json);

      expect(headline.id, '2');
      expect(headline.title, 'Headline from Json');
      expect(headline.description, 'Description from Json');
      expect(headline.url, 'https://example.com');
      expect(headline.imageUrl, 'https://example.com/image.png');
      expect(headline.publishedAt, DateTime.parse('2024-03-07T12:00:00Z'));
      expect(headline.source, sampleSource);
      expect(headline.categories, sampleCategories);
      expect(headline.eventCountry, sampleCountry);
    });

    test('toJson', () {
      final headline = Headline(
        id: '3',
        title: 'Headline to Json',
        description: 'Description to Json',
        url: 'https://example.com/toJson',
        imageUrl: 'https://example.com/imageToJson.png',
        publishedAt: DateTime.parse('2024-03-07T14:00:00Z'),
        source: sampleSource,
        categories: sampleCategories,
        eventCountry: sampleCountry,
      );
      final json = headline.toJson();

      expect(json['id'], '3');
      expect(json['title'], 'Headline to Json');
      expect(json['description'], 'Description to Json');
      expect(json['url'], 'https://example.com/toJson');
      expect(json['imageUrl'], 'https://example.com/imageToJson.png');
      expect(json['publishedAt'], '2024-03-07T14:00:00.000Z');
      expect(json['source'], sampleSource.toJson());
      expect(
        json['categories'],
        sampleCategories.map((c) => c.toJson()).toList(),
      );
      expect(json['event_country'], sampleCountry.toJson());
    });

    test('props', () {
      final headline = Headline(
        id: '4',
        title: 'Headline props',
        description: 'Description props',
        url: 'https://example.com/props',
        imageUrl: 'https://example.com/imageProps.png',
        publishedAt: DateTime.parse('2024-03-07T16:00:00Z'),
        source: sampleSource,
        categories: sampleCategories,
        eventCountry: sampleCountry,
      );

      expect(headline.props, [
        '4',
        'Headline props',
        'Description props',
        'https://example.com/props',
        'https://example.com/imageProps.png',
        DateTime.parse('2024-03-07T16:00:00Z'),
        sampleSource,
        sampleCategories,
        sampleCountry,
      ]);
    });

    test('copyWith', () {
      final headline = Headline(
        id: '5',
        title: 'Headline copyWith',
        description: 'Description copyWith',
        url: 'https://example.com/copyWith',
        imageUrl: 'https://example.com/imageCopyWith.png',
        publishedAt: DateTime.parse('2024-03-07T18:00:00Z'),
        source: sampleSource,
        categories: sampleCategories,
        eventCountry: sampleCountry,
      );
      final updatedSource = Source(id: 'src-2', name: 'Updated Source');
      final copiedHeadline = headline.copyWith(
        title: 'Updated Title',
        source: updatedSource,
      );

      expect(copiedHeadline.id, '5');
      expect(copiedHeadline.title, 'Updated Title');
      expect(copiedHeadline.description, 'Description copyWith');
      expect(copiedHeadline.url, 'https://example.com/copyWith');
      expect(copiedHeadline.imageUrl, 'https://example.com/imageCopyWith.png');
      expect(
        copiedHeadline.publishedAt,
        DateTime.parse('2024-03-07T18:00:00Z'),
      );
      expect(copiedHeadline.source, updatedSource); // Check updated source
      expect(copiedHeadline.categories, sampleCategories); // Should be original
      expect(copiedHeadline.eventCountry, sampleCountry); // Should be original
    });

    test('copyWith - no changes', () {
      final headline = Headline(
        id: '5',
        title: 'Headline copyWith',
        description: 'Description copyWith',
        url: 'https://example.com/copyWith',
        imageUrl: 'https://example.com/imageCopyWith.png',
        publishedAt: DateTime.parse('2024-03-07T18:00:00Z'),
        source: sampleSource,
        categories: sampleCategories,
        eventCountry: sampleCountry,
      );
      final copiedHeadline = headline.copyWith();

      expect(copiedHeadline.id, '5');
      expect(copiedHeadline.title, 'Headline copyWith');
      expect(copiedHeadline.description, 'Description copyWith');
      expect(copiedHeadline.url, 'https://example.com/copyWith');
      expect(copiedHeadline.imageUrl, 'https://example.com/imageCopyWith.png');
      expect(
        copiedHeadline.publishedAt,
        DateTime.parse('2024-03-07T18:00:00Z'),
      );
      expect(copiedHeadline.source, sampleSource);
      expect(copiedHeadline.categories, sampleCategories);
      expect(copiedHeadline.eventCountry, sampleCountry);
    });
  });
}
