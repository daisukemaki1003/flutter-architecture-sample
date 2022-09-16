abstract class UseCase<InputData, OutputData> {
  // Future<Either<Failure, OutputData>> handle(InputData inputData);
  OutputData handle(InputData input);
}
