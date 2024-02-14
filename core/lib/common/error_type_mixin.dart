import 'package:core/common/result.dart';

mixin ErrorTypeEnumMixin {
  Failure<D, F> toFailure<D, F>() => Failure(this as F);
}