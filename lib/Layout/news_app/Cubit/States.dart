abstract class NewStates{}

class NewStateIntialisier extends NewStates {}

class NewBottomNavState extends NewStates {}

class getLoadingstatebuisness extends NewStates {

}

class getLoadingstatesport extends NewStates {}

class getNewStateSuccesBusiness extends NewStates {}

class getNewStateErreurBusiness extends NewStates{

  final String erreur;
  getNewStateErreurBusiness(this.erreur);
}





class getNewStateSuccessport extends NewStates {}

class getNewStateErreursport extends NewStates{

  final String erreur;
  getNewStateErreursport(this.erreur);
}

class getLoadingstatescience extends NewStates {}

class getNewStateSuccesscience extends NewStates {}

class getNewStateErreurscience extends NewStates
{
  final String erreur;
  getNewStateErreurscience(this.erreur);
}

class getLoadingstatesearch extends NewStates {}

class getNewStateSuccessearch extends NewStates {}

class getNewStateErreursearch extends NewStates
{
  final String erreur;
  getNewStateErreursearch(this.erreur);
}

class AppChangeModeState extends NewStates {}