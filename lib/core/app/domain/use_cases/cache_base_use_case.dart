abstract class CacheBaseUseCase<T, Parameter> {
  Future<T> call({required Parameter parameter});
}
