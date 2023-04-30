
abstract class AppStates {}

class InitialState extends  AppStates {}

class ChangeBottomNavBar extends  AppStates {}

class BusinessLoading extends  AppStates {}

class GetBusinessSuccess extends  AppStates {}

class GetBusinessFailed extends  AppStates {
  final String error;
  GetBusinessFailed(this.error);
}


class SportsLoading extends  AppStates {}

class GetSportsSuccess extends  AppStates {}

class GetSportsFailed extends  AppStates {
  final String error;
  GetSportsFailed(this.error);
}


class ScienceLoading extends  AppStates {}

class GetScienceSuccess extends  AppStates {}

class GetScienceFailed extends  AppStates {
  final String error;
  GetScienceFailed(this.error);
}


class SearchLoading extends  AppStates {}

class GetSearchSuccess extends  AppStates {}

class GetSearchFailed extends  AppStates {
  final String error;
  GetSearchFailed(this.error);
}
