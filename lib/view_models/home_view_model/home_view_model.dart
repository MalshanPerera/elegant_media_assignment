import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../../models/items_model.dart';

abstract class HomeViewModel extends ChangeNotifier {
  void loadItems();

  List<Data>? get items;
}
