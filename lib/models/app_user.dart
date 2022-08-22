class AppUser {
  String? username;
  String? id;
  String? email;
  String? city;
  String? country;
  AppUser({
    this.id,
    required this.email,
    required this.username,
    required this.city,
    required this.country,
  });

  AppUser.fromMap(Map<String, dynamic> data) {
    username = data['userName'];
    email = data['email'];
    city = data['city'];
    country = data['country'];
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'userName': username,
      'city': city,
      'country': country,
    };
  }
}
