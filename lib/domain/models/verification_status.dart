class VerificationStatus {
  String phoneNumber;
  bool isVerified;
  bool codeSent;
  String resendToken;
  VerificationStatus({
    required this.phoneNumber,
    required this.isVerified,
    required this.codeSent,
    required this.resendToken,
  });

  @override
  bool operator ==(covariant VerificationStatus other) {
    if (identical(this, other)) return true;

    return other.phoneNumber == phoneNumber &&
        other.isVerified == isVerified &&
        other.codeSent == codeSent &&
        other.resendToken == resendToken;
  }

  @override
  int get hashCode {
    return phoneNumber.hashCode ^
        isVerified.hashCode ^
        codeSent.hashCode ^
        resendToken.hashCode;
  }
}
