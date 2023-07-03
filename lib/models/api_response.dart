class ApiResponse {
  Object _data = Object();
  Object _error = Object();

  Object get Data => _data;
  set Data(Object data) => _data = data;

  Object get ApiError => _error;
  set ApiError(Object error) => _error = error;
}
