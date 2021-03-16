abstract class LoadFoodPresenter {
  Stream<bool> get isLoadingStream;

  Future<void> loadData();
}
