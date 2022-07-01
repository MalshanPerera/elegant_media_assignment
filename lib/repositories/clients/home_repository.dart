import '../../models/cats_model.dart';

abstract class HomeRepository {
  Future<Cats?> getCats();
}
