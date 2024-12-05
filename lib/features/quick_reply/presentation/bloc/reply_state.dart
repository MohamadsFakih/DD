part of 'reply_bloc.dart';

@freezed
class ReplyState with _$ReplyState {
  const factory ReplyState.initial(
      {@Default(PostResponse()) PostResponse postResponse,
      @Default(false) bool isLoading}) = _Initial;
}
