import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../../models/hotels_model.dart';

abstract class HomeViewModel extends ChangeNotifier {
  void loadHotels();

  List<Data>? get hotels;
}
