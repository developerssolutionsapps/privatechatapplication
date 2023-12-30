import 'package:private_chat/core/exceptions/auth_exceptions.dart';

import '../enums/auth_exceptions.dart';

class AuthExceptionHandler {
  static FirebaseAuthError handleException(e) {
    print(e.code);
    FirebaseAuthError status;
    switch (e.code) {
      case "ERROR_INVALID_VERIFICATION_CODE":
        status = FirebaseAuthError.invalidVerificationCode;
        break;
      case "ERROR_SESSION_EXPIRED":
        status = FirebaseAuthError.sessionExpired;
        break;
      case "ERROR_QUOTA_EXCEEDED":
        status = FirebaseAuthError.quotaExceeded;
        break;
      case "ERROR_NETWORK_REQUEST_FAILED":
        status = FirebaseAuthError.networkRequestFailed;
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        status = FirebaseAuthError.tooManyRequests;
        break;
      case "ERROR_INVALID_VERIFICATION_ID":
        status = FirebaseAuthError.invalidVerificationId;
        break;
      case "ERROR_REQUIRES_RECENT_LOGIN":
        status = FirebaseAuthError.requiresRecentLogin;
        break;
      default:
        status = FirebaseAuthError.unknownError;
    }
    return status;
  }

  static String generateExceptionMessage(FirebaseAuthError exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case FirebaseAuthError.invalidVerificationCode:
        errorMessage = "The verification code entered is invalid.";
        break;
      case FirebaseAuthError.sessionExpired:
        errorMessage = "The verification session has expired.";
        break;
      case FirebaseAuthError.quotaExceeded:
        errorMessage = "Quota for verification requests exceeded.";
        break;
      case FirebaseAuthError.networkRequestFailed:
        errorMessage = "Network request for verification failed.";
        break;
      case FirebaseAuthError.tooManyRequests:
        errorMessage = "Too many verification requests. Try again later.";
        break;
      case FirebaseAuthError.invalidVerificationId:
        errorMessage = "The verification ID used is invalid.";
        break;
      case FirebaseAuthError.requiresRecentLogin:
        errorMessage = "Recent login is required for this operation.";
        break;
      default:
        errorMessage = "An undefined error occurred during verification.";
    }

    return errorMessage;
  }

  static void throwExceptionByErrorCode(String errorCode) {
    switch (errorCode) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        throw InvalidVerificationCodeException();
      case 'ERROR_SESSION_EXPIRED':
        throw SessionExpiredException();
      case 'ERROR_QUOTA_EXCEEDED':
        throw QuotaExceededException();
      case 'ERROR_NETWORK_REQUEST_FAILED':
        throw NetworkRequestFailedException();
      case 'ERROR_TOO_MANY_REQUESTS':
        throw TooManyRequestsException();
      case 'ERROR_INVALID_VERIFICATION_ID':
        throw InvalidVerificationIdException();
      case 'ERROR_REQUIRES_RECENT_LOGIN':
        throw RequiresRecentLoginException();
      default:
        throw GenericAuthException();
    }
  }

  static String getUserFriendlyErrorMessage(Exception exception) {
    if (exception is InvalidVerificationCodeException) {
      return "The verification code entered is invalid. Please try again.";
    } else if (exception is SessionExpiredException) {
      return "The verification session has expired. Please request a new code.";
    } else if (exception is QuotaExceededException) {
      return "Quota for verification requests has been exceeded. Try again later.";
    } else if (exception is NetworkRequestFailedException) {
      return "Network error occurred. Please check your internet connection.";
    } else if (exception is TooManyRequestsException) {
      return "Too many requests. Please try again later.";
    } else if (exception is InvalidVerificationIdException) {
      return "The verification ID used is invalid. Please request a new code.";
    } else if (exception is RequiresRecentLoginException) {
      return "Recent login is required for this operation.";
    } else if (exception is UserNotLoggedInException) {
      return "User is not logged in. Please log in to continue.";
    } else if (exception is CodeAutoRetrievalTimeoutException) {
      return "The code auto-retrieval has timed out. Please retry the process.";
    } else if (exception is PhoneVerificationFailedException) {
      return "Phone verification failed. Please try again.";
    } else if (exception is CodeRetrievalTimeoutException) {
      return "The code retrieval has timed out. Please retry the process.";
    } else if (exception is GenericAuthException) {
      return "An unexpected error occurred. Please try again later.";
    } else {
      return "An unexpected error occurred. Please try again later.";
    }
  }
}
