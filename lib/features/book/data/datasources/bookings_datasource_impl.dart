import 'package:injectable/injectable.dart';
import 'package:sketch_app/core/models/booking_model.dart';
import 'package:sketch_app/core/services/firebase_database_service.dart';
import 'package:sketch_app/features/book/data/datasources/bookings_datasource.dart';

@Injectable(as: BookingsDatasource)
class BookingsDatasourceImpl implements BookingsDatasource {
  BookingsDatasourceImpl(this._databaseService);

  final FirebaseDatabaseService _databaseService;

  @override
  Future<String> submitBooking(BookingModel booking) =>
      _databaseService.createBooking(booking.toJson());
}
