import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/home/presentation/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState
            .initial()); // Use the `initial` method to ensure consistent initialization

  void onTabTapped(int index) {
    // Emit new state with updated selectedIndex
    emit(state.copyWith(selectedIndex: index));
  }

  void updateCarouselIndex(int index) {
    // Emit new state with updated carousel index
    emit(state.copyWith(currentCarouselIndex: index));
  }
}
