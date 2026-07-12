import 'package:codealpha_random_quote_generator/features/quotes/data/repository/quote_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('QuoteRepository', () {
    test('contains at least 100 local quotes', () {
      final repository = QuoteRepository();

      expect(repository.quotes.length, greaterThanOrEqualTo(100));
    });

    test('does not return the same quote consecutively', () {
      final repository = QuoteRepository();
      final firstQuote = repository.getRandomQuote();

      for (var index = 0; index < 20; index++) {
        final nextQuote = repository.getRandomQuote(currentQuote: firstQuote);

        expect(nextQuote.text, isNot(firstQuote.text));
      }
    });
  });
}
