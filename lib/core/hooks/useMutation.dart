import 'package:flutter_hooks/flutter_hooks.dart';

typedef MutationFn<T, R> = Future<R> Function(T);

class MutationResult<T, R> {
  final bool isLoading;
  final bool isError;
  final dynamic error;
  final R? data;
  final MutationFn<T, R>? mutate;

  MutationResult({
    this.isLoading = false,
    this.isError = false,
    this.error,
    this.data,
    this.mutate,
  });
}

/// A hook that performs a mutation and updates the UI with the result.
///
/// The `useMutation` hook takes a `mutationFn` parameter, which is a function
/// that performs the mutation and returns a `Future` with the result. It also
/// takes an optional `initialData` parameter that specifies the initial data
/// for the mutation result.
///
/// The hook returns a `MutationResult` object that contains the loading state,
/// error state, error message, data, and `mutate` function. The `mutate`
/// function can be called to perform the mutation and update the state

MutationResult<T, R> useMutation<T, R>(
  MutationFn<T, R> mutationFn, {
  R? initialData,
}) {
  final isLoading = useState(false);
  final isError = useState(false);
  final error = useState<dynamic>(null);
  final data = useState(initialData);

  Future<R> mutate(T variables) async {
    isLoading.value = true;
    isError.value = false;
    error.value = null;

    try {
      final result = await mutationFn(variables);
      data.value = result;
      return result;
    } catch (e) {
      isError.value = true;
      error.value = e;
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  return MutationResult(
    isLoading: isLoading.value,
    isError: isError.value,
    error: error.value,
    data: data.value,
    mutate: mutate,
  );
}
