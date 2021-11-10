import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "sign_in_form_bloc.freezed.dart";
part "sign_in_form_event.dart";
part "sign_in_form_state.dart";

/*
  This BloC is separated into parts.
  BloC library is a lot like Zustand for React.
 */

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc(SignInFormState initialState)
      : super(SignInFormState.initial());

  @override
  Stream<SignInFormState> mapEventToState(SignInFormEvent event) {
    throw UnimplementedError();
  }
}
