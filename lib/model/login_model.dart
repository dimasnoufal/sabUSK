//i will create a class for model and how my data will be reading

class userModel {
  final nama;
  final nim_nidn;
  final email;
  final password;
  final level;
  final id;

  userModel(
      {this.nama,
      this.nim_nidn,
      this.email,
      this.password,
      this.level,
      this.id});

  factory userModel.fromJson(Map<String, dynamic> json) {
    return userModel(
      nama: json['nama'],
      nim_nidn: json['nim_nidn'],
      email: json['email'],
      password: json['password'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJsonAdd() {
    return {
      "nama": nama,
      "nik": nim_nidn,
      "email": email,
      "password": password,
    };
  }

  // Map<String, dynamic> toJsonDelete_and_Update() {
  //   return {
  //     "Name": Name,
  //     "Email": Email,
  //     "Address": Address,
  //     "id": id,
  //   };
  // }
}
