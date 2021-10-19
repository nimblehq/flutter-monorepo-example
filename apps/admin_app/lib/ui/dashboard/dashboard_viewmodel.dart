import 'package:admin_app/di/di.dart';
import 'package:admin_app/ui/dashboard/dashboard_state.dart';
import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardViewModelProvider =
    StateNotifierProvider.autoDispose<DashboardViewModel, DashboardState>(
        (_) => DashboardViewModel(getIt.get<AuthRepository>()));

class DashboardViewModel extends StateNotifier<DashboardState> {
  final AuthRepository _authRepository;
  DashboardViewModel(this._authRepository) : super(DashboardState());

  void login() {
    print("DashboardViewModel authRepository: ${_authRepository.hashCode}");
    _authRepository.login(email: "dev@nimblehq.co", password: "12345678");
  }
}
