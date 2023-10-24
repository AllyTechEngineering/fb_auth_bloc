import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fb_auth_bloc/models/custom_error.dart';
import 'package:fb_auth_bloc/models/user_model.dart';
import 'package:fb_auth_bloc/repositories/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
}
