class Friend {
  final String name;
  final String sunsign;
  final String birthday;
  final String birthtime;
  final String element;

  const Friend({this.name, this.sunsign, this.birthday, this.birthtime, this.element});
} // Friend

List<Friend> friends = [
  const Friend(
    name: "Aries Aviles",
    sunsign: "Taurus",
    birthday: "10 May 1997",
    birthtime: "03:00",
    element: "earth",
  ),
  const Friend(
    name: "Assata Bellegarde",
    sunsign: "Pisces",
    birthday: "14 Mar 1998",
    birthtime: "12:11",
    element: "water",
  ),
  const Friend(
    name: "Bren Augustine",
    sunsign: "Cancer",
    birthday: "",
    birthtime: "",
    element: "water",
  )
];