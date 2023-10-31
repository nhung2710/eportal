class BaseEportalResponse {
  int status = 0;

  String message = "Có lỗi xảy ra vui lòng thử lại sau";

  BaseEportalResponse({required this.status, required this.message});

  BaseEportalResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
