part of 'userprofile_cubit.dart';

@immutable
abstract class UserprofileState {}

class UserprofileInitial extends UserprofileState {}
class LoadingUserPageDone extends UserprofileState {}
class LoadingUserPageFailed extends UserprofileState {}
class LoadingUserPageLoading extends UserprofileState {}

