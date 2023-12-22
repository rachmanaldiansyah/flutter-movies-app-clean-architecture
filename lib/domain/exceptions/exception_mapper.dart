class ExceptionMapper<From, To> implements Exception {
  final String message;

  ExceptionMapper(this.message);

  @override
  String toString() => 'Error when mapping class $From to $To: $message';
}
