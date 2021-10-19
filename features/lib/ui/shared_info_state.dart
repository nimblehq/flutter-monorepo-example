import 'package:freezed_annotation/freezed_annotation.dart';

part 'shared_info_state.freezed.dart';

@freezed
class SharedInfoState with _$SharedInfoState {
  factory SharedInfoState() = SharedInfoStateConstructor;
}
