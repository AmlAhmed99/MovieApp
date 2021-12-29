class MessageCode{
  MessageCode({
    String code,
    String message,
}) {
    _code = code;
    _message = message;
  }

  MessageCode.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
  }
  String _code;
  String _message;

  String get code => _code;
  String get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
  }

}