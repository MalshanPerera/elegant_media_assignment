import 'package:elegant_media_assignment/models/cats_model.dart';

abstract class HomeRepository {
  Future<Cats?> getCats();
}
