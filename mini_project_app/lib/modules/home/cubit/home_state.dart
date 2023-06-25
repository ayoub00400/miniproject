part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class LoadingHomePageUsersDone extends HomeState {}
class LoadingHomePageUsers extends HomeState {}
class LoadingHomePageUsersFailed extends HomeState {}
