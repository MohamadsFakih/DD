part of 'contribute_bloc.dart';

@freezed
class ContributeEvent with _$ContributeEvent {
  const factory ContributeEvent.submitContent(SendContentParams params) =
      SubmitContent;
}
