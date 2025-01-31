import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/core/common/snackbar/my_snackbar.dart';
import 'package:job_scout_project/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:job_scout_project/features/auth/domain/use_case/upload_image_usecase.dart';


part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;
  final UploadImageUsecase _uploadImageUsecase;

  RegisterBloc({
      required RegisterUseCase registerUseCase,
      required UploadImageUsecase uploadImageUsecase
      })
      : _registerUseCase = registerUseCase,
        _uploadImageUsecase = uploadImageUsecase,
        super(RegisterState.initial()) {
    on<RegisterUserEvent>(_onRegisterUserEvent);
    on<LoadImage>(_onLoadImage);
  }

  void _onRegisterUserEvent(
      RegisterUserEvent event, 
      Emitter<RegisterState> emit)
       async {
    emit(state.copyWith(isLoading: true));
    final result = await _registerUseCase.call(
      RegisterUserParams(
        email: event.email,
        contactNo: event.contactNo,
        username: event.username,
        password: event.password,
        image: state.imageName,
      ),
    );

    result.fold(
      (l) => {emit(state.copyWith(isLoading: false, isSuccess: false)),
      mySnackBar(context: event.context, message: l.message , color: Colors.blue)
      },
      (r) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        mySnackBar(context: event.context, message: "Registration Successful" ,);
      },
    );
  }

    void _onLoadImage(
    LoadImage event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _uploadImageUsecase.call(
      UploadImageParams(file: event.file),
    );

    result.fold(
      (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
      (r) {
      emit(state.copyWith(isLoading: false, isSuccess: true, imageName: r));
    });
  }
}
