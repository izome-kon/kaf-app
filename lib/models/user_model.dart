class User {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String birthdate;
  final String gender;
  final String type;
  final String bloodType;
  final String imageUrl;
  final int naID;
  static User curUser;
  User({
    this.id,
    this.name,
    this.imageUrl,
    this.birthdate,
    this.bloodType,
    this.email,
    this.gender,
    this.phone,
    this.type,
    this.naID,
  });

  User curuntUser() {
    return curUser;
  }

  setUser(User user) {
    curUser = user;
  }

  List<String> getUserList() {
    List<String> user = List<String>();
    user.add(this.id);
    user.add(this.name);
    user.add(this.imageUrl);
    user.add(this.birthdate);
    user.add(this.bloodType);
    user.add(this.email);
    user.add(this.gender);
    user.add(this.phone);
    user.add(this.type);
    user.add(this.naID.toString());
    return user;
  }
}
