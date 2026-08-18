import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_app/core/models/booking_model.dart';
import 'package:sketch_app/features/book/data/repos/bookings_repo.dart';
import 'package:sketch_app/features/book/presentation/cubit/book_state.dart';

@injectable
class BookCubit extends Cubit<BookState> {
  BookCubit(this._repo) : super(const BookInitial());

  final BookingsRepo _repo;

  Future<void> submitBooking(BookingModel booking) async {
    if (state is BookLoading) return;
    emit(const BookLoading());
    try {
      await _repo.submitBooking(booking);
      emit(const BookSuccess());
    } catch (_) {
      emit(const BookError('Unable to submit your booking. Please try again.'));
    }
  }
}
