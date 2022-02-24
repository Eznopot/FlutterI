class UserModel {
  final String? email;
  final String? password;
  final String? username;
  final String? imagePath;
  final String? description;

  String? getEmail() {
    return email;
  }

  String? getPassword() {
    return password;
  }

  String? getUsername() {
    return username;
  }

  String? getImagePath() {
    return imagePath;
  }

  String? getDescription() {
    return imagePath;
  }

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserModel(
      parsedJson['email'] ?? "",
      parsedJson['password'] ?? "",
      parsedJson['username'] ?? "",
      parsedJson['description'] ?? "",
      parsedJson['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "username": username,
      "description": description,
      "imagePath": imagePath,
    };
  }

  UserModel(this.email, this.password, this.username, this.description, this.imagePath);
}