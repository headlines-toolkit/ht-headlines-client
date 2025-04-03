import 'package:ht_categories_client/ht_categories_client.dart';
import 'package:ht_countries_client/ht_countries_client.dart';
import 'package:ht_headlines_client/ht_headlines_client.dart';
import 'package:ht_sources_client/ht_sources_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHtHeadlinesClient extends Mock implements HtHeadlinesClient {}

// Sample data for nested models used in tests
final sampleSource = Source(id: 'src-test', name: 'Source 1');
final sampleCategory = Category(id: 'cat-test', name: 'category1');
final sampleCountry = Country(
  id: 'ctry-test',
  isoCode: 'US',
  name: 'United States',
  flagUrl: 'url/to/us/flag.png',
);

void main() {
  group('HtHeadlinesClient', () {
    late HtHeadlinesClient client;

    setUp(() {
      client = MockHtHeadlinesClient();
    });

    group('getHeadlines', () {
      test('should call getHeadlines with correct parameters', () async {
        // Use DateTime.utc for consistent testing regardless of local timezone
        final testTime = DateTime.utc(2024, 3, 8, 10);
        final expectedHeadlines = [
          Headline(
            id: 'h1',
            title: 'Headline 1',
            source: sampleSource,
            publishedAt: testTime,
            categories: [sampleCategory],
            eventCountry: sampleCountry,
          ),
        ];

        when(
          () => client.getHeadlines(
            limit: any(named: 'limit'),
            startAfterId: any(named: 'startAfterId'),
            categoryId: any(named: 'categoryId'),
            sourceId: any(named: 'sourceId'),
            eventCountryId: any(named: 'eventCountryId'),
          ),
        ).thenAnswer((_) async => expectedHeadlines);

        await client.getHeadlines(
          limit: 10,
          startAfterId: 'someId',
          categoryId: 'someCategoryId',
          sourceId: 'someSourceId',
          eventCountryId: 'someCountryId',
        );

        verify(
          () => client.getHeadlines(
            limit: 10,
            startAfterId: 'someId',
            categoryId: 'someCategoryId',
            sourceId: 'someSourceId',
            eventCountryId: 'someCountryId',
          ),
        ).called(1);
      });

      test('returns headlines when the call completes successfully', () async {
        // Use DateTime.utc for consistent testing regardless of local timezone
        final testTime = DateTime.utc(2024, 3, 8, 10);
        final expectedHeadlines = [
          Headline(
            id: 'h1',
            title: 'Headline 1',
            source: sampleSource,
            publishedAt: testTime,
            categories: [sampleCategory],
            eventCountry: sampleCountry,
          ),
        ];
        when(
          () => client.getHeadlines(),
        ).thenAnswer((_) async => expectedHeadlines);

        final actualHeadlines = await client.getHeadlines();

        expect(actualHeadlines, expectedHeadlines);
      });
    });
  });

  group('Headlines Exceptions', () {
    test('HeadlinesFetchException', () {
      const exception = HeadlinesFetchException('fetch exception');
      expect(exception.message, 'fetch exception');
    });

    test('HeadlineNotFoundException', () {
      const exception = HeadlineNotFoundException('not found exception');
      expect(exception.message, 'not found exception');
    });

    test('HeadlineCreateException', () {
      const exception = HeadlineCreateException('create exception');
      expect(exception.message, 'create exception');
    });

    test('HeadlineUpdateException', () {
      const exception = HeadlineUpdateException('update exception');
      expect(exception.message, 'update exception');
    });

    test('HeadlineDeleteException', () {
      const exception = HeadlineDeleteException('delete exception');
      expect(exception.message, 'delete exception');
    });

    test('HeadlinesSearchException', () {
      const exception = HeadlinesSearchException('search exception');
      expect(exception.message, 'search exception');
    });
  });
}
