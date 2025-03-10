import 'package:ht_headlines_client/ht_headlines_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHtHeadlinesClient extends Mock implements HtHeadlinesClient {}

void main() {
  group('HtHeadlinesClient', () {
    late HtHeadlinesClient client;

    setUp(() {
      client = MockHtHeadlinesClient();
    });

    group('getHeadlines', () {
      test('should call getHeadlines with correct parameters', () async {
        final expectedHeadlines = [
          Headline(
            id: '1',
            title: 'Headline 1',
            source: 'Source 1',
            publishedAt: DateTime.now(),
            categories: const ['category1'],
            eventCountry: 'US',
          ),
        ];

        when(
          () => client.getHeadlines(
            limit: any(named: 'limit'),
            startAfterId: any(named: 'startAfterId'),
            category: any(named: 'category'),
            source: any(named: 'source'),
            eventCountry: any(named: 'eventCountry'),
          ),
        ).thenAnswer((_) async => expectedHeadlines);

        await client.getHeadlines(
          limit: 10,
          startAfterId: 'someId',
          category: 'someCategory',
          source: 'someSource',
          eventCountry: 'someCountry',
        );

        verify(
          () => client.getHeadlines(
            limit: 10,
            startAfterId: 'someId',
            category: 'someCategory',
            source: 'someSource',
            eventCountry: 'someCountry',
          ),
        ).called(1);
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
