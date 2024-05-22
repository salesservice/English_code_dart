class KategoriModell {
  int? kategoriId;
  String? kategoriName;
  String? kategoriImage;
  String? kategoriDatetime;

  KategoriModell(
      {this.kategoriId,
      this.kategoriName,
      this.kategoriImage,
      this.kategoriDatetime});

  KategoriModell.fromJson(Map<String, dynamic> json) {
    kategoriId = json['kategori_id'];
    kategoriName = json['kategori_name'];
    kategoriImage = json['kategori_image'];
    kategoriDatetime = json['kategori_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kategori_id'] = this.kategoriId;
    data['kategori_name'] = this.kategoriName;
    data['kategori_image'] = this.kategoriImage;
    data['kategori_datetime'] = this.kategoriDatetime;
    return data;
  }
}
