import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'home_state.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  //image picker
  String? imagePath;
  void pickMedia() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      imagePath = file.path;
      emit(PickImageSuccessState());
    } else  {
    emit(PickImageErrorState());
    }
  }

  //counter && duration
  bool change = false;
  Duration duration = const Duration();
  void counter ()async {
    duration = new Duration();
    const countdownDuration = Duration(seconds: 5  );
    Timer? timer;
    bool countDown =true;
    duration = countdownDuration;
    emit(StartDurationState());
    void addTime(){
      final addSeconds = countDown ? -1 : 1;
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0){
        timer?.cancel();
        emit(ChangeDurationEndState());
        change = true;
        emit(EndDurationState());
      } else{
        emit(ChangeDurationStartState());
        duration = Duration(seconds: seconds);
      }
    }
    void startTimer(){
      timer = Timer.periodic(const Duration(seconds: 1),(_) => addTime());
      emit(ChangeDurationLoadingState());
    }
    startTimer();

  }
}




