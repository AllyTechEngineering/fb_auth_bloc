import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

/// # user_model.dart
/// * profileImage stores the user's image as a string in the form of a URL
/// * point to store the user's activity score
/// * rank to display the grade based on user's activity: bronze.
/// silver and gold, when registered for the first time they are bronze.
/// * No function to modify the rank in this app.
/// * The original image should be stored in firebase storage, we will save the link that will dynamically generates the image.
/// # factory constructor:
/// * reads a user document from firestore.
///
/// # Bang operator !
/// The Bang operator does nothing more than tell Dart that even if we have defined some variable as a Nullable type, it will definitely not be null.
///
/// # the second factory constructor User.initialUser is to provide initial data so that we don't have to deal with nulls.
class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final int point;
  final String rank;
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.point,
    required this.rank,
  });

  factory User.formDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>?; // 'as' type cast

    return User(
        id: userDoc.id,
        name: userData![
            'name'], // userData! null assertion operator AKA bang operator.
        email: userData['email'],
        profileImage: userData['profileImage'],
        point: userData['point'],
        rank: userData['rank']);
  } //factory User.formDoc

    factory User.initialUser() {
    return const User(
        id: '',
        name: '', // userData! null assertion operator AKA bang operator.
        email: '',
        profileImage: '',
        point: -1,
        rank: '');
  } //factory User.initialUser

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      profileImage,
      point,
      rank,
    ];
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, profileImage: $profileImage, point: $point, rank: $rank)';
  }
}
