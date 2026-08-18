sealed class BookState {
  const BookState();
}

final class BookInitial extends BookState {
  const BookInitial();
}

final class BookLoading extends BookState {
  const BookLoading();
}

final class BookSuccess extends BookState {
  const BookSuccess();
}

final class BookError extends BookState {
  const BookError(this.message);

  final String message;
}
