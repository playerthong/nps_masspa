class ApiResponse {
  bool success;
  bool err;
  bool message;
  dynamic data;

  ApiResponse({this.success, this.err, this.message, this.data});

  ApiResponse.fromJson(Map<String, dynamic> json) {    
    this.success = json['success'];
    this.err = json['err'];
    this.message = json['message'];
    this.data = json['data'] != null ? (json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['err'] = this.err;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }

}


