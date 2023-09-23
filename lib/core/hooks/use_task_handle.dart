import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poulty_manager/core/client/state/request_state.dart';

enum TaskStatus { loading, error, data }

void emptyFunction() {}

class TaskResult<T> {
  final TaskStatus status;
  final T? data;
  final dynamic error;
  final void Function() runTask;

  TaskResult(this.status,
      {this.data, this.error, this.runTask = emptyFunction});
}

TaskResult<T> useTask<T>(Task<T> task) {
  final result = useState<TaskResult<T>>(TaskResult(TaskStatus.loading));

  final runTask = useCallback(() {
    result.value = TaskResult(TaskStatus.loading);
    task.toTaskEither().run().then((either) {
      either.fold(
        (error) {
          result.value = TaskResult(TaskStatus.error, error: error);
        },
        (data) {
          result.value = TaskResult(TaskStatus.data, data: data);
        },
      );
    });
  }, [task]);

  return TaskResult(result.value.status,
      data: result.value.data, error: result.value.error, runTask: runTask);
}

({RequestStatus<T> status, Function trigger}) useRequestState<T>(Task<T> task) {
  final result = useState<RequestStatus<T>>(const InitialRequestStatus());

  final runTask = useCallback(() {
    result.value = const LoadingRequestStatus();

    task.toTaskEither().run().then((either) {
      either.fold(
        (error) {
          result.value = ErrorRequestStatus(error.toString());
        },
        (data) {
          result.value = SuccessRequestStatus(data);
        },
      );
    });
  }, [task]);

  return (
    status: result.value,
    trigger: runTask,
  );
}
