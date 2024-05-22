enum MediaTyp { image, text }

class StoryModell {
  int? storyId;
  String? storyImage;
  int? storySett;
  String? storyBeskrivelse;
  int? storyKat;
  int? storyItem;
  int? storyPris;
  int? storyUser;
  String? storyCreate;
  String? mediaTypen;
  int? kategoriId;
  String? kategoriName;
  String? kategoriImage;
  String? kategoriDatetime;
  int? userId;
  String? userImage;
  String? userFname;
  Null? userLname;
  String? userEmail;
  int? userPhone;
  String? userPassword;
  String? userBpassord;
  int? userVerivode;
  Null? userPhonekode;
  int? userApprove;
  String? userCreate;
  int? itemId;
  String? itemName;
  String? itemBeskrivelse;
  String? itemIamge;
  int? itemCount;
  String? itemBy;
  int? itemAktiv;
  int? itemLikt;
  int? itemPris;
  int? itemSett;
  String? itemDato;
  int? itemKat;

  StoryModell(
      {this.storyId,
      this.storyImage,
      this.storySett,
      this.storyBeskrivelse,
      this.storyKat,
      this.storyItem,
      this.storyPris,
      this.storyUser,
      this.storyCreate,
      this.mediaTypen,
      this.kategoriId,
      this.kategoriName,
      this.kategoriImage,
      this.kategoriDatetime,
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
      this.itemId,
      this.itemName,
      this.itemBeskrivelse,
      this.itemIamge,
      this.itemCount,
      this.itemBy,
      this.itemAktiv,
      this.itemLikt,
      this.itemPris,
      this.itemSett,
      this.itemDato,
      this.itemKat});

  StoryModell.fromJson(Map<String, dynamic> json) {
    storyId = json['story_id'];
    storyImage = json['story_image'];
    storySett = json['story_sett'];
    storyBeskrivelse = json['story_beskrivelse'];
    storyKat = json['story_kat'];
    storyItem = json['story_item'];
    storyPris = json['story_pris'];
    storyUser = json['story_user'];
    storyCreate = json['story_create'];
    mediaTypen = json['media_typen'];
    kategoriId = json['kategori_id'];
    kategoriName = json['kategori_name'];
    kategoriImage = json['kategori_image'];
    kategoriDatetime = json['kategori_datetime'];
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
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemBeskrivelse = json['item_beskrivelse'];
    itemIamge = json['item_iamge'];
    itemCount = json['item_count'];
    itemBy = json['item_by'];
    itemAktiv = json['item_aktiv'];
    itemLikt = json['item_likt'];
    itemPris = json['item_pris'];
    itemSett = json['item_sett'];
    itemDato = json['item_dato'];
    itemKat = json['item_kat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['story_id'] = this.storyId;
    data['story_image'] = this.storyImage;
    data['story_sett'] = this.storySett;
    data['story_beskrivelse'] = this.storyBeskrivelse;
    data['story_kat'] = this.storyKat;
    data['story_item'] = this.storyItem;
    data['story_pris'] = this.storyPris;
    data['story_user'] = this.storyUser;
    data['story_create'] = this.storyCreate;
    data['media_typen'] = this.mediaTypen;
    data['kategori_id'] = this.kategoriId;
    data['kategori_name'] = this.kategoriName;
    data['kategori_image'] = this.kategoriImage;
    data['kategori_datetime'] = this.kategoriDatetime;
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
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_beskrivelse'] = this.itemBeskrivelse;
    data['item_iamge'] = this.itemIamge;
    data['item_count'] = this.itemCount;
    data['item_by'] = this.itemBy;
    data['item_aktiv'] = this.itemAktiv;
    data['item_likt'] = this.itemLikt;
    data['item_pris'] = this.itemPris;
    data['item_sett'] = this.itemSett;
    data['item_dato'] = this.itemDato;
    data['item_kat'] = this.itemKat;
    return data;
  }
}
