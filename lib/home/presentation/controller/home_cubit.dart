import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'home_state.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

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

  bool change = false;
  Duration duration = const Duration();
  void counter ()async {
    duration = new Duration();
    const countdownDuration = Duration(seconds: 5  );
    Timer? timer;
    bool countDown =true;
    duration = countdownDuration;
    print('start');
    emit(StartDurationState());
    print('start1');
    print(duration);
    print(change);

    void addTime(){
      final addSeconds = countDown ? -1 : 1;
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0){
        timer?.cancel();
        emit(ChangeDurationEndState());
        print('change');
        change = true;
        print(change);
        emit(EndDurationState());
        print('shefo');

      } else{
        emit(ChangeDurationStartState());
        duration = Duration(seconds: seconds);
        print('duration');
        print(duration);


      }
    }

    void startTimer(){
      timer = Timer.periodic(const Duration(seconds: 1),(_) => addTime());
      emit(ChangeDurationLoadingState());
    }
    startTimer();

  }
}




