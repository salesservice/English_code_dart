class UserModell {
  int? userId;
  String? userImage;
  String? userFname;
  Null userLname;
  String? userEmail;
  int? userPhone;
  String? userPassword;
  String? userBpassord;
  int? userVerivode;
  Null userPhonekode;
  int? userApprove;
  String? userCreate;

  UserModell({
    this.userId,
    this.userImage,
    this.userFname,
    this.userLname,
    this.userEmail,
    this.userPhone,
    this.userPassword,
    this.userBpassord,
    this.userVerivode,
    this.userPhonekode,
    this.userApprove,
    this.userCreate,
  });

  UserModell.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userImage = json['user_image'];
    userFname = json['user_fname'];
    userLname = json['user_lname'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userPassword = json['user_password'];
    userBpassord = json['user_bpassord'];
    userVerivode = json['user_verivode'];
    userPhonekode = json['user_phonekode'];
    userApprove = json['user_approve'];
    userCreate = json['user_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_image'] = this.userImage;
    data['user_fname'] = this.userFname;
    data['user_lname'] = this.userLname;
    data['user_email'] = this.userEmail;
    data['user_phone'] = this.userPhone;
    data['user_password'] = this.userPassword;
    data['user_bpassord'] = this.userBpassord;
    data['user_verivode'] = this.userVerivode;
    data['user_phonekode'] = this.userPhonekode;
    data['user_approve'] = this.userApprove;
    data['user_create'] = this.userCreate;
    return data;
  }
}
