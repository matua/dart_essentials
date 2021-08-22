void main() {
  ComputationUser user = ComputationUser('Jonathan');
  print(user.name);
  SonOfComputationUser son = SonOfComputationUser('George', 33);
  print(son.name + ' ' + son.sonParameter.toString());
}

class User {
  String name;
  int age;

  User(name, age)
      : name = name,
        age = age;
}

class SimpleUser {
  String name;

  SimpleUser(this.name);
}

class ComputationUser {
  static addToName(n) => 'Sir ' + n;
  String name;

  ComputationUser(name) : name = addToName(name);
}

class SonOfComputationUser extends ComputationUser {
  int sonParameter;

  SonOfComputationUser(name, this.sonParameter) : super(name);
}
