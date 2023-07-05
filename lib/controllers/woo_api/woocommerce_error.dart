class WooCommerceError {
  String? _code;
  String? _message;
  Data? _data;

  WooCommerceError({String? code, String? message, Data? data}) {
    _code = code;
    _message = message;
    _data = data;
  }

  WooCommerceError.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  @override
  String toString() {
    return "WooCommerce Error!\ncode: $_code\nmessage: $_message\nstatus: ${_data?.status}";
  }
}

class Data {
  int? _status;

  Data({required int status}) {
    _status = status;
  }

  int? get status => _status;

  Data.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
  }
}
