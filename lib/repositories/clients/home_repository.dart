import '../../models/items_model.dart';

abstract class HomeRepository {
  Future<Items?> getItems();
}
