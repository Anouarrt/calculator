abstract class ShopLoginstates{}

class  InisialisiersopState extends ShopLoginstates{}

class  LoadingShopState extends ShopLoginstates{}

class  ShopLoginSuccessState extends ShopLoginstates{}



class  ShopLoginErrorState extends ShopLoginstates
{
  late final String error;

  ShopLoginErrorState(this.error);
}


class  ShopLoginchangepasswordState extends ShopLoginstates{}