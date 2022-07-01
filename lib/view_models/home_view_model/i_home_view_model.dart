import '../../models/cats_model.dart';
import '../../repositories/clients/home_repository.dart';
import '../../services/error_service.dart';
import '../../services/navigation_service.dart';
import 'home_view_model.dart';

class IHomeViewModel extends HomeViewModel {
  final HomeRepository homeRepository;
  final NavigationService navigationService;
  final ErrorService errorService;

  List<Data>? _catsList = [];

  IHomeViewModel({
    required this.homeRepository,
    required this.navigationService,
    required this.errorService,
  });

  @override
  void loadCats() {
    homeRepository.getCats().then((cats) {
      if (cats != null) {
        _catsList = cats.data.toList();
      } else {
        _catsList = null;
      }
      notifyListeners();
    });
  }

  @override
  List<Data>? get cats => _catsList;
}
