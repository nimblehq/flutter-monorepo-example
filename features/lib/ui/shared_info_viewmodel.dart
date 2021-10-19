import 'package:core/core.dart';
import 'package:features/di/di.dart';
import 'package:features/ui/shared_info_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sharedInfoViewModelProvider =
    StateNotifierProvider.autoDispose<SharedInfoViewModel, SharedInfoState>(
        (_) => SharedInfoViewModel(featureGetIt.get<AuthRepository>()));

class SharedInfoViewModel extends StateNotifier<SharedInfoState> {
  final AuthRepository _authRepository;
  SharedInfoViewModel(this._authRepository) : super(SharedInfoState());

  void login() {
    print("SharedInfoViewModel authRepository: ${_authRepository.hashCode}");
    _authRepository.login(email: 'dev@nimblehq.co', password: '12345678');
  }
}
