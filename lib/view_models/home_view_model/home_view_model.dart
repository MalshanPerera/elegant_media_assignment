import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../../models/cats_model.dart';

abstract class HomeViewModel extends ChangeNotifier {
  void loadCats();

  List<Data>? get cats;
}
