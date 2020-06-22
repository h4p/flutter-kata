import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:quoteapp/repositories/repositories.dart';
import 'package:quoteapp/models/models.dart';
import 'package:quoteapp/bloc/bloc.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuoteRepository repository;

  QuoteBloc({@required this.repository}) : assert(repository != null);

  @override
  QuoteState get initialState => QuoteEmpty();

  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    if (event is FetchQuote) {
      yield QuoteLoading();
      try {
        final Quote quote = await repository.fetchQuote();
        yield QuoteLoaded(quote: quote);
      } catch (_) {
        yield QuoteError();
      }
    }
  }
}