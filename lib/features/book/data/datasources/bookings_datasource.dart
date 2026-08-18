import 'package:sketch_app/core/models/booking_model.dart';

abstract class BookingsDatasource {
  Future<String> submitBooking(BookingModel booking);
}
