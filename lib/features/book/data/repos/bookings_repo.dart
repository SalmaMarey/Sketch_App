import 'package:sketch_app/core/models/booking_model.dart';

abstract class BookingsRepo {
  Future<String> submitBooking(BookingModel booking);
}
