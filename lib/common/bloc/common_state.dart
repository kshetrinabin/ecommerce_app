abstract class CommonState{}

class CommonInitialState extends CommonState{}

class CommonLoadingState extends CommonState{
  final bool showLoading;
  CommonLoadingState({this.showLoading = true});
}
class CommonSuccessState<Type> extends CommonState{
 Type itemData;
 CommonSuccessState({required this.itemData});
}
class CommonErrorState extends CommonState{
  String message;
  CommonErrorState({
    required this.message
  });

}