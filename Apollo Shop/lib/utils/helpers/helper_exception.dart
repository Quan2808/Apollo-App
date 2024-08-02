class HelperException {
  static String getLoginException(e) {
    String errorMessage = 'An error occurred. Please try again.';

    if (e.contains('User not found')) {
      errorMessage = 'Invalid User or Password. Please try again.';
    } else if (e.contains('Wrong password')) {
      errorMessage = 'Invalid User or Password. Please try again.';
    } else if (e.contains('User has not been confirmed')) {
      errorMessage =
          'Your account has not been confirmed. Please check your email for the confirmation link.';
    } else {
      errorMessage = 'An error occurred. Please try again.';
    }

    return errorMessage;
  }
}
