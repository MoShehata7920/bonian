abstract class BonianStates {}

class BonianInitialState extends BonianStates {}

class BonianGetProductsSuccessState extends BonianStates {}

class BonianGetProductsLoadingState extends BonianStates {}

class BonianGetproductsErrorState extends BonianStates {
  final String error;

  BonianGetproductsErrorState(this.error);
}
