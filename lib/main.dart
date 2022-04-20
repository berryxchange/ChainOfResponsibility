import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class PersonModel {
  String firstName;
  String lastName;
  int classification;

  PersonModel(
      {required this.firstName,
      required this.lastName,
      required this.classification});
}

class ClassificationChecker {
  ClassificationChecker? nextLink;

  //check user classificaition
  checkUserClassificaion(PersonModel thisUser) {
    if (thisUser.classification == "unAuthoried") {
      presentUnAuthorizedClearance(thisPseron: thisUser);
    } else {
      presentAuthorizedClearance(thisPseron: thisUser);
      nextLink!.checkUserClassificaion(thisUser);
    }
  }

  ClassificationChecker();

//presentAuthorizedClearance
  presentAuthorizedClearance({required PersonModel thisPseron}) {
    print("${thisPseron.firstName} is cleared for entry Level ~");
  }

  ClassificationChecker? createChain() {
    List<ClassificationChecker> classifications = [
      LowSecurityClearanceChecker(),
      MediumSecurityClearanceChecker(),
      HighSecurityClearanceChecker(),
      TopSecurityClearanceChecker()
    ];

    ClassificationChecker? link;

    for (ClassificationChecker cc in classifications.reversed) {
      ClassificationChecker? existingLink;
      existingLink = link;
      link = cc;
      link.nextLink = existingLink;
    }

    return link;
  }

  //presentUnAuthorizedClearance
  presentUnAuthorizedClearance({required PersonModel thisPseron}) {
    //print("${thisPseron.firstName} is not cleared for entry");
    print("Welcome ${thisPseron.firstName} to Level ~ ");
  }
}

//LowSecurityClearanceChecker
class LowSecurityClearanceChecker implements ClassificationChecker {
  @override
  ClassificationChecker? nextLink;

  @override
  checkUserClassificaion(PersonModel thisUser) {
    if (thisUser.classification < 1) {
      presentUnAuthorizedClearance(thisPseron: thisUser);
    } else {
      presentAuthorizedClearance(thisPseron: thisUser);
      nextLink!.checkUserClassificaion(thisUser);
    }
  }

  @override
  ClassificationChecker? createChain() {
    List<ClassificationChecker> classifications = [
      LowSecurityClearanceChecker(),
      MediumSecurityClearanceChecker(),
      HighSecurityClearanceChecker(),
      TopSecurityClearanceChecker()
    ];

    ClassificationChecker? link;

    for (ClassificationChecker cc in classifications.reversed) {
      ClassificationChecker? existingLink;
      existingLink = link;
      link = cc;
      link.nextLink = existingLink;
    }

    return link;
  }

  @override
  presentAuthorizedClearance({required PersonModel thisPseron}) {
    print("${thisPseron.firstName} is cleared for Low Level entry");
  }

  @override
  presentUnAuthorizedClearance({required PersonModel thisPseron}) {
    print("${thisPseron.firstName} is not cleared for Low Level entry");
    print("Welcome ${thisPseron.firstName} to the Low Level Security Office!");
  }
}

//MediumSecurityClearanceChecker
class MediumSecurityClearanceChecker implements ClassificationChecker {
  @override
  ClassificationChecker? nextLink;

  @override
  checkUserClassificaion(PersonModel thisUser) {
    if (thisUser.classification < 2) {
      presentUnAuthorizedClearance(thisPseron: thisUser);
    } else {
      presentAuthorizedClearance(thisPseron: thisUser);
      nextLink!.checkUserClassificaion(thisUser);
    }
  }

  @override
  ClassificationChecker? createChain() {
    List<ClassificationChecker> classifications = [
      LowSecurityClearanceChecker(),
      MediumSecurityClearanceChecker(),
      HighSecurityClearanceChecker(),
      TopSecurityClearanceChecker()
    ];

    ClassificationChecker? link;

    for (ClassificationChecker cc in classifications.reversed) {
      ClassificationChecker? existingLink;
      existingLink = link;
      link = cc;
      link.nextLink = existingLink;
    }

    return link;
  }

  @override
  presentAuthorizedClearance({required PersonModel thisPseron}) {
    print("${thisPseron.firstName} is cleared for Medium Level entry");
  }

  @override
  presentUnAuthorizedClearance({required PersonModel thisPseron}) {
    //print("${thisPseron.firstName} is not cleared for Medium Level entry");
    print("Welcome ${thisPseron.firstName} to the Low Level Security Office!");
  }
}

//HighSecurityClearanceChecker
class HighSecurityClearanceChecker implements ClassificationChecker {
  @override
  ClassificationChecker? nextLink;

  @override
  checkUserClassificaion(PersonModel thisUser) {
    if (thisUser.classification < 3) {
      presentUnAuthorizedClearance(thisPseron: thisUser);
    } else {
      presentAuthorizedClearance(thisPseron: thisUser);
      nextLink!.checkUserClassificaion(thisUser);
    }
  }

  @override
  ClassificationChecker? createChain() {
    List<ClassificationChecker> classifications = [
      LowSecurityClearanceChecker(),
      MediumSecurityClearanceChecker(),
      HighSecurityClearanceChecker(),
      TopSecurityClearanceChecker()
    ];

    ClassificationChecker? link;

    for (ClassificationChecker cc in classifications.reversed) {
      ClassificationChecker? existingLink;
      existingLink = link;
      link = cc;
      link.nextLink = existingLink;
    }

    return link;
  }

  @override
  presentAuthorizedClearance({required PersonModel thisPseron}) {
    print("${thisPseron.firstName} is cleared for High Level entry");
  }

  @override
  presentUnAuthorizedClearance({required PersonModel thisPseron}) {
    //print("${thisPseron.firstName} is not cleared for High Level entry");
    print(
        "Welcome ${thisPseron.firstName} to the Medium Level Security Office!");
  }
}

//TopSecurityClearanceChecker
class TopSecurityClearanceChecker implements ClassificationChecker {
  @override
  ClassificationChecker? nextLink;

  @override
  checkUserClassificaion(PersonModel thisUser) {
    if (thisUser.classification < 4) {
      presentUnAuthorizedClearance(thisPseron: thisUser);
    } else {
      presentAuthorizedClearance(thisPseron: thisUser);
      print("Welcome ${thisUser.firstName} to the Top Level Security Office!");
    }
  }

  @override
  ClassificationChecker? createChain() {
    List<ClassificationChecker> classifications = [
      LowSecurityClearanceChecker(),
      MediumSecurityClearanceChecker(),
      HighSecurityClearanceChecker(),
      TopSecurityClearanceChecker()
    ];

    ClassificationChecker? link;

    for (ClassificationChecker cc in classifications.reversed) {
      ClassificationChecker? existingLink;
      existingLink = link;
      link = cc;
      link.nextLink = existingLink;
    }

    return link;
  }

  @override
  presentAuthorizedClearance({required PersonModel thisPseron}) {
    print("${thisPseron.firstName} is cleared for Top Level entry");
  }

  @override
  presentUnAuthorizedClearance({required PersonModel thisPseron}) {
    //print("${thisPseron.firstName} is not cleared for Top Level entry");
    print("Welcome ${thisPseron.firstName} to the High Level Security Office!");
  }
}

class _MainPageState extends State<MainPage> {
  var chain = ClassificationChecker().createChain();

  List<PersonModel> people = [
    PersonModel(firstName: "Mike", lastName: "Didka", classification: 1),
    PersonModel(firstName: "Donna", lastName: "Summers", classification: 2),
    PersonModel(firstName: "Carl", lastName: "Winslow", classification: 3),
    PersonModel(firstName: "Agent", lastName: "K", classification: 4)
  ];

  @override
  void initState() {
    for (PersonModel p in people) {
      chain!.checkUserClassificaion(p);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
