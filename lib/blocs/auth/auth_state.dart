
part of 'auth_bloc.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthState extends Equatable {
  final AuthStatus authStatus; //enum AuthStatus
  final fbAuth.User? user; // in AuthBLoc: import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
  const AuthState({
    required this.authStatus,
    this.user,
  });

  @override
  List<Object?> get props => [authStatus, user];

  @override
  String toString() => 'AuthState(authStatus: $authStatus, user: $user)';

  AuthState copyWith({
    AuthStatus? authStatus,
    fbAuth.User? user,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
    );
  } //AuthState
  
} //class AuthState

