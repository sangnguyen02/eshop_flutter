import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  final String username;
  final String password;
  final String fullname;
  final String phone;
  final String email;
  final String role;
  final bool status;


  SignUpRequest({
    required this.username,
    required this.password,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.role,
    required this.status,

  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}