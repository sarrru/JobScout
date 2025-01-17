import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/auth/presentation/view/login_view.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/login/login_bloc.dart';

class OnboardingCubit extends Cubit<void> {
  OnboardingCubit(this._loginBloc) : super(null);

  final LoginBloc _loginBloc;

  void openLoginView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _loginBloc,
                  child: LoginView(),
                )));
  }
}


// on boarding cubit ma navigation ko all logic matra huncha .
// yo onloginview lai onboardingpage ko next ma call garna parcha .add... gardai


// hamle cubit splash ra onboarding ma matra use garcham.
// cubit ma state ra event hudaina 

// adhi kunai page arko sanga depend cha bhane di ma dependencies inject garna nabirsau