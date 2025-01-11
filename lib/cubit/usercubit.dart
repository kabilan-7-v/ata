import 'package:ata/models/usermodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserModel> {
  UserCubit()
      : super(
          UserModel(userName: "", email: "", phno: "",
          bio: "",dateofbirth: "",image: "",gender: "",
          userid: ""
          ),
        );

  void setUser(UserModel userModel) {
    emit(userModel);
  }
}
