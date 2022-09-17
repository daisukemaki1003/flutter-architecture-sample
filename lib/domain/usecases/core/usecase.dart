abstract class UseCase<InputData, OutputData> {
  OutputData handle(InputData input);
}
