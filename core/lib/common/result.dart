sealed class Result<D, F> {}

class Success<D, F> implements Result<D, F> {
  final D data;
  const Success(this.data);
}

class Failure<D, F> implements Result<D, F> {
  final F type;
  const Failure(this.type);
}

// Represents a value that is not of any interest.
// Used when a function returns a Success without any data
class Unit {}