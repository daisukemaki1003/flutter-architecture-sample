abstract class UseCase<Input, Output> {
  Future<Output> handle(Input input);
}
