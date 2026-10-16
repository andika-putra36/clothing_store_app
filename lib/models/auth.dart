class SignInRequest {
  final String? email;
  final String? password;

  SignInRequest({this.email, this.password});
}

class SignInResponse {
  final SignInToken? signInToken;
  final SignInUser? signInUser;

  SignInResponse({this.signInToken, this.signInUser});
}

class SignInToken {
  final String? accessToken;
  final String? refreshToken;

  SignInToken({this.accessToken, this.refreshToken});
}

class SignInUser {
  final int? userId;
  final int? roleId;
  final String? email;
  final int? customerId;
  final int? adminId;

  SignInUser({
    this.userId,
    this.roleId,
    this.email,
    this.customerId,
    this.adminId,
  });
}
