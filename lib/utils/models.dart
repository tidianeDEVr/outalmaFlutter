class User {
  String? firstName;
  String? lastName;
  String? email;

  get getFirstName => firstName;
  set setFirstName(String? firstName) => this.firstName = firstName;

  get getLastName => lastName;
  set setLastName(lastName) => this.lastName = lastName;

  get getEmail => email;
  set setEmail(email) => this.email = email;

  User(this.firstName, this.lastName, this.email);
}

class Package {
  String deliveryMethod;
  String state;
  String reference;

  get getDeliveryMethod => deliveryMethod;
  set setDeliveryMethod(String deliveryMethod) =>
      this.deliveryMethod = deliveryMethod;

  get getState => state;
  set setState(state) => this.state = state;

  get getReference => reference;
  set setReference(reference) => this.reference = reference;

  Package(this.deliveryMethod, this.state, this.reference);
}
