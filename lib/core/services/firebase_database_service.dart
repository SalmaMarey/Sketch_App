import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseDatabaseService {
  FirebaseDatabaseService() : _database = FirebaseDatabase.instance;

  final FirebaseDatabase _database;

  Future<Map<String, dynamic>> categories() => _readMap('categories');
  Future<Map<String, dynamic>> projects() => _readMap('projects');

  Future<String> createBooking(Map<String, dynamic> booking) async {
    final reference = _database.ref('bookings').push();
    final bookingId = reference.key;
    if (bookingId == null) throw StateError('Unable to create a booking ID.');
    await reference.set({...booking, 'id': bookingId});
    return bookingId;
  }

  Future<Map<String, dynamic>?> project(String projectId) async {
    final snapshot = await _database.ref('projects/$projectId').get();
    if (!snapshot.exists || snapshot.value is! Map) return null;
    return Map<String, dynamic>.from(snapshot.value as Map);
  }

  Future<Map<String, dynamic>> _readMap(String path) async {
    final snapshot = await _database.ref(path).get();
    if (!snapshot.exists || snapshot.value is! Map) return {};
    return Map<String, dynamic>.from(snapshot.value as Map);
  }

  List<MapEntry<String, Map<String, dynamic>>> rooms(
    Map<String, dynamic> project,
  ) {
    final rawRooms = project['rooms'];
    if (rawRooms is Map) {
      return rawRooms.entries
          .where((entry) => entry.value is Map)
          .map(
            (entry) => MapEntry(
              entry.key.toString(),
              Map<String, dynamic>.from(entry.value as Map),
            ),
          )
          .toList();
    }
    if (rawRooms is List) {
      return rawRooms
          .asMap()
          .entries
          .where((entry) => entry.value is Map)
          .map(
            (entry) => MapEntry(
              entry.key.toString(),
              Map<String, dynamic>.from(entry.value as Map),
            ),
          )
          .toList();
    }
    return [];
  }

  List<MapEntry<String, Map<String, dynamic>>> sortedRooms(
    Map<String, dynamic> project,
  ) {
    final result = rooms(project);
    result.sort(
      (a, b) => _sortOrder(a.value).compareTo(_sortOrder(b.value)),
    );
    return result;
  }

  int _sortOrder(Map<String, dynamic> room) =>
      int.tryParse(room['sortOrder']?.toString() ?? '') ?? 0;
}
