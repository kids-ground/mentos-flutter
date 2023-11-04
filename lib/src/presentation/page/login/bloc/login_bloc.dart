import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:mentos_flutter/src/data/data_source/data_source.dart';
import 'package:mentos_flutter/src/data/dto/request/login/login_request.dart';
import 'package:mentos_flutter/src/data/repository/network/auth_repository.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';
import 'package:mentos_flutter/src/util/resource/logger.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthRepository authRepository,
    required LocalKeyValueDataSource localKeyValueDataSource
  }): _authRepository = authRepository,
        _localKeyValueDataSource = localKeyValueDataSource,
        super(const LoginState()) {
    on<LoginPressedKakaoLoginEvent>(_onPressedKakaoLogin);
    on<LoginPressedAppleLoginEvent>(_onPressedAppleLogin);
  }

  final AuthRepository _authRepository;
  final LocalKeyValueDataSource _localKeyValueDataSource;

  Future<void> _onPressedKakaoLogin(
    LoginPressedKakaoLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    OAuthToken kakakoOAuthToken;

    try {
      kakakoOAuthToken = await isKakaoTalkInstalled()
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();
    } catch(e) {
      logger.e('카카오 로그인 에러 : ${e.toString()}');
      emit(state.copyWith(status: LoginStatus.failure));
      return;
    }

    var isSignup = await _isSignupWithFetch(LoginType.kakao.name.toUpperCase(), kakakoOAuthToken.accessToken);

    emit(state.copyWith(status: isSignup ? LoginStatus.signUp : LoginStatus.signIn));
  }

  Future<void> _onPressedAppleLogin(
    LoginPressedAppleLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    AuthorizationCredentialAppleID token;

    try {
      token = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName
      ]);
    } catch (e) {
      logger.e('애플 로그인 에러 : ${e.toString()}');
      emit(state.copyWith(status: LoginStatus.failure));
      return;
    }

    var isSignup = await _isSignupWithFetch(LoginType.apple.name.toUpperCase(), token.identityToken ?? "");

    emit(state.copyWith(status: isSignup ? LoginStatus.signUp : LoginStatus.signIn));
  }

  Future<bool> _isSignupWithFetch(String loginType, String token) async {
    // Server 통신
    var request = LoginRequest(loginType: loginType, token: token);
    var response = await _authRepository.signIn(request);

    // 저장
    _localKeyValueDataSource.setAccessToken(response.accessToken);
    _localKeyValueDataSource.setRefreshToken(response.refreshToken);

    return response.isSignup == true;
  }
}