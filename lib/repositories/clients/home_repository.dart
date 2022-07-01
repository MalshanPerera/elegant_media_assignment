import '../../models/hotels_model.dart';

abstract class HomeRepository {
  Future<Hotels?> getHotels();
}
