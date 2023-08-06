class User {
  String? firstName;
  String? lastName;
  String? email;

  User(this.firstName, this.lastName, this.email);
}

class Package {
  String deliveryMethod;
  String state;
  String reference;

  Package(this.deliveryMethod, this.state, this.reference);
}

class Country {
  String name;
  String flag;
  Country(this.name, this.flag);
  @override
  toString() {
    return name;
  }
}
