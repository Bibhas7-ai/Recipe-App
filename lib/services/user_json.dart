class User {
  final String firstName;
  final String lastName;
  final int age;
  final String gender;
  final String email;
  final int phone;
  final String username;
  final String image;

  User({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json['firstName'],
        lastName: json['lastName'],
        age: json['age'],
        gender: json['gender'],
        email: json['email'],
        phone: json['phone'],
        username: json['username'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
        'gender': gender,
        'email': email,
        'phone': phone,
        'username': username,
        'image': image,
      };
}
