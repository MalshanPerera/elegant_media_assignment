import '../../models/items_model.dart';
import '../../repositories/clients/home_repository.dart';
import '../../services/error_service.dart';
import '../../services/navigation_service.dart';
import 'home_view_model.dart';

class IHomeViewModel extends HomeViewModel {
  final HomeRepository homeRepository;
  final NavigationService navigationService;
  final ErrorService errorService;

  List<Data>? _itemList = [];

  IHomeViewModel({
    required this.homeRepository,
    required this.navigationService,
    required this.errorService,
  });

  @override
  void loadItems() {
    homeRepository.getItems().then((items) {
      if (items != null) {
        _itemList = items.data.toList();
      } else {
        _itemList = null;
      }
      notifyListeners();
    });
  }

  @override
  List<Data>? get items => _itemList;
}
