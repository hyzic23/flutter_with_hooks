class ApiResponse {
  Object _data = new Object();
  Object _error = new Object();

  Object get Data => _data;
  set Data(Object data) => _data = data;

  Object get ApiError => _error as Object;
  set ApiError(Object error) => _error = error;
}
