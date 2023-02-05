abstract class UseCaseParam {
  const UseCaseParam();
}

abstract class BaseUseCase<UCC extends UseCaseParam, R extends dynamic> {
  R call(UCC param);
}

abstract class CommandUseCase<UCC extends UseCaseParam, R extends dynamic> implements BaseUseCase<UCC, Future<R>> {}

abstract class QueryUseCase<UCC extends UseCaseParam, R extends dynamic> extends BaseUseCase<UCC, R> {}
