// Firebase authentication exceptions
class InvalidVerificationCodeException implements Exception {}

class SessionExpiredException implements Exception {}

class QuotaExceededException implements Exception {}

class NetworkRequestFailedException implements Exception {}

class TooManyRequestsException implements Exception {}

class InvalidVerificationIdException implements Exception {}

class RequiresRecentLoginException implements Exception {}

// Handling generic auth exceptions
class UserNotLoggedInException implements Exception {}

class CodeAutoRetrievalTimeoutException implements Exception {}

class PhoneVerificationFailedException implements Exception {}

class CodeRetrievalTimeoutException implements Exception {}

class GenericAuthException implements Exception {}
