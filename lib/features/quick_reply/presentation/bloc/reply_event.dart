part of 'reply_bloc.dart';

@freezed
class ReplyEvent with _$ReplyEvent {
  const factory ReplyEvent.quickReply(ReplyParams params) = QuickReply;
}
