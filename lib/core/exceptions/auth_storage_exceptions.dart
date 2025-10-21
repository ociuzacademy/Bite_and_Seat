class AuthStorageException implements Exception {
  final String message;
  final dynamic originalError;

  AuthStorageException(this.message, [this.originalError]);

  @override
  String toString() =>
      'AuthStorageException: $message${originalError != null ? '\nOriginal error: $originalError' : ''}';
}

class LoginStorageException extends AuthStorageException {
  LoginStorageException(String message, [dynamic originalError])
    : super('Login failed: $message', originalError);
}

class LogoutStorageException extends AuthStorageException {
  LogoutStorageException(String message, [dynamic originalError])
    : super('Logout failed: $message', originalError);
}

class GetUserIdStorageException extends AuthStorageException {
  GetUserIdStorageException(String message, [dynamic originalError])
    : super('Failed to get user ID: $message', originalError);
}

class GetLoginStatusStorageException extends AuthStorageException {
  GetLoginStatusStorageException(String message, [dynamic originalError])
    : super('Failed to get login status: $message', originalError);
}
