import 'package:injectable/injectable.dart';
import 'package:sketch_app/core/models/booking_model.dart';
import 'package:sketch_app/features/book/data/datasources/bookings_datasource.dart';
import 'package:sketch_app/features/book/data/repos/bookings_repo.dart';

@Injectable(as: BookingsRepo)
class BookingsRepoImpl implements BookingsRepo {
  BookingsRepoImpl(this._datasource);

  final BookingsDatasource _datasource;

  @override
  Future<String> submitBooking(BookingModel booking) =>
      _datasource.submitBooking(booking);
}
