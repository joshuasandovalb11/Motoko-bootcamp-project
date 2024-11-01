import Principal "mo:base/Principal";

actor {
  stable var name: Text = "";

  type User = (Text, Nat);

  var user: [User] = [
    ("Jose", 45),
    ("Adrian", 56)
  ];

  public shared func setName(newName: Text): async (){
    name := newName;
  };

  public query func getName(): async Text{
    return name;
  };

  public shared func deleteName(): async (){
    name := "";
  };

  public shared query ({caller}) func whoAmI(): async Principal {
    return caller;
  };

  public shared query ({caller})func getUsers(): async [User]{
    if (Principal.isAnonymous(caller)){
      return [];
    };
    return user;
  };

};
