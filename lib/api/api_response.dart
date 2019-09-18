class ApiResponse {
  int code;
  int error;
  String message;
  dynamic data;

  ApiResponse({this.code, this.error, this.message, this.data});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    this.code = json['code'];
    this.error = json['error'];
    this.message = json['message'];
    this.data = json['data'] != null ? (json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }

  bool isSuccess(){
    return code==1? true:false;
  }
}


