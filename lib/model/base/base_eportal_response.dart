class BaseEportalResponse {
  int status = 0;
  String message = "Có lỗi xảy ra vui lòng thử lại sau";

  BaseEportalResponse({required this.status, required this.message});

  factory BaseEportalResponse.fromJson(Map<String, dynamic> json) {
    return BaseEportalResponse(status: json["status"],message: json["message"]);
  }

}