import 'dart:async';

import 'package:meta/meta.dart';

import 'package:quoteapp/repositories/quote_api_client.dart';
import 'package:quoteapp/models/models.dart';

class QuoteRepository {
  final QuoteApiClient quoteApiClient;

  QuoteRepository({@required this.quoteApiClient})
      : assert(quoteApiClient != null);

  Future<Quote> fetchQuote() async {
    return await quoteApiClient.fetchQuote();
  }
}