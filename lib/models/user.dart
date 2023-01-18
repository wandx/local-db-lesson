class User {
  final int id;
  final String name;
  final String accountNumber;

  User({
    required this.id,
    required this.name,
    required this.accountNumber,
  });

  factory User.empty() {
    return User(
      id: 0,
      name: '',
      accountNumber: '',
    );
  }
}
