import '../../models/hotels_model.dart';
import '../../repositories/clients/home_repository.dart';
import '../../services/error_service.dart';
import '../../services/navigation_service.dart';
import 'home_view_model.dart';

class IHomeViewModel extends HomeViewModel {
  final HomeRepository homeRepository;
  final NavigationService navigationService;
  final ErrorService errorService;

  List<Data>? _hotelList = [];

  IHomeViewModel({
    required this.homeRepository,
    required this.navigationService,
    required this.errorService,
  });

  @override
  void loadHotels() {
    homeRepository.getHotels().then((hotels) {
      if (hotels != null) {
        _hotelList = hotels.data.toList();
      } else {
        _hotelList = null;
      }
      notifyListeners();
    });
  }

  @override
  List<Data>? get hotels => _hotelList;
}
