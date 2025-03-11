import 'package:ht_headlines_client/src/models/headline.dart';
import 'package:test/test.dart';

void main() {
  group('Headline', () {
    test('constructor', () {
      const headline = Headline(id: '1', title: 'Test Headline');
      expect(headline.id, '1');
      expect(headline.title, 'Test Headline');
      expect(headline.description, null);
      expect(headline.url, null);
      expect(headline.imageUrl, null);
      expect(headline.publishedAt, null);
      expect(headline.source, null);
      expect(headline.categories, null);
      expect(headline.eventCountry, null);
    });

    test('fromJson', () {
      final json = {
        'id': '2',
        'title': 'Headline from Json',
        'description': 'Description from Json',
        'url': 'https://example.com',
        'imageUrl': 'https://example.com/image.png',
        'publishedAt': '2024-03-07T12:00:00Z',
        'source': 'Test Source',
        'categories': ['business', 'tech'],
        'eventCountry': 'US',
      };
      final headline = Headline.fromJson(json);
      expect(headline.id, '2');
      expect(headline.title, 'Headline from Json');
      expect(headline.description, 'Description from Json');
      expect(headline.url, 'https://example.com');
      expect(headline.imageUrl, 'https://example.com/image.png');
      expect(headline.publishedAt, DateTime.parse('2024-03-07T12:00:00Z'));
      expect(headline.source, 'Test Source');
      expect(headline.categories, ['business', 'tech']);
      expect(headline.eventCountry, 'US');
    });

    test('toJson', () {
      final headline = Headline(
        id: '3',
        title: 'Headline to Json',
        description: 'Description to Json',
        url: 'https://example.com/toJson',
        imageUrl: 'https://example.com/imageToJson.png',
        publishedAt: DateTime.parse('2024-03-07T14:00:00Z'),
        source: 'Source to Json',
        categories: const ['sports', 'politics'],
        eventCountry: 'CA',
      );
      final json = headline.toJson();
      expect(json['id'], '3');
      expect(json['title'], 'Headline to Json');
      expect(json['description'], 'Description to Json');
      expect(json['url'], 'https://example.com/toJson');
      expect(json['imageUrl'], 'https://example.com/imageToJson.png');
      expect(json['publishedAt'], '2024-03-07T14:00:00.000Z');
      expect(json['source'], 'Source to Json');
      expect(json['categories'], ['sports', 'politics']);
      expect(json['eventCountry'], 'CA');
    });

    test('props', () {
      final headline = Headline(
        id: '4',
        title: 'Headline props',
        description: 'Description props',
        url: 'https://example.com/props',
        imageUrl: 'https://example.com/imageProps.png',
        publishedAt: DateTime.parse('2024-03-07T16:00:00Z'),
        source: 'Source props',
        categories: const ['tech', 'finance'],
        eventCountry: 'GB',
      );
      expect(headline.props, [
        '4',
        'Headline props',
        'Description props',
        'https://example.com/props',
        'https://example.com/imageProps.png',
        DateTime.parse('2024-03-07T16:00:00Z'),
        'Source props',
        ['tech', 'finance'],
        'GB',
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
        source: 'Source copyWith',
        categories: const ['science', 'environment'],
        eventCountry: 'AU',
      );
      final copiedHeadline = headline.copyWith(title: 'Updated Title');
      expect(copiedHeadline.id, '5');
      expect(copiedHeadline.title, 'Updated Title');
      expect(copiedHeadline.description, 'Description copyWith');
      expect(copiedHeadline.url, 'https://example.com/copyWith');
      expect(copiedHeadline.imageUrl, 'https://example.com/imageCopyWith.png');
      expect(
        copiedHeadline.publishedAt,
        DateTime.parse('2024-03-07T18:00:00Z'),
      );
      expect(copiedHeadline.source, 'Source copyWith');
      expect(copiedHeadline.categories, ['science', 'environment']);
      expect(copiedHeadline.eventCountry, 'AU');
    });

    test('copyWith - no changes', () {
      final headline = Headline(
        id: '5',
        title: 'Headline copyWith',
        description: 'Description copyWith',
        url: 'https://example.com/copyWith',
        imageUrl: 'https://example.com/imageCopyWith.png',
        publishedAt: DateTime.parse('2024-03-07T18:00:00Z'),
        source: 'Source copyWith',
        categories: const ['science', 'environment'],
        eventCountry: 'AU',
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
      expect(copiedHeadline.source, 'Source copyWith');
      expect(copiedHeadline.categories, ['science', 'environment']);
      expect(copiedHeadline.eventCountry, 'AU');
    });
  });
}
