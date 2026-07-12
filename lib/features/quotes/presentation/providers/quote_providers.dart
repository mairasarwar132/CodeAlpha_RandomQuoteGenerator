import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/quote.dart';
import '../../data/repository/quote_repository.dart';

final quoteRepositoryProvider = Provider<QuoteRepository>((ref) {
  return QuoteRepository();
});

final quoteControllerProvider = NotifierProvider<QuoteController, Quote>(
  QuoteController.new,
);

class QuoteController extends Notifier<Quote> {
  late final QuoteRepository _repository;

  @override
  Quote build() {
    _repository = ref.watch(quoteRepositoryProvider);
    return _repository.getRandomQuote();
  }

  int get totalQuotes => _repository.quotes.length;

  void generateNewQuote() {
    state = _repository.getRandomQuote(currentQuote: state);
  }
}
