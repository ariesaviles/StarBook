/*
  Creates FriendAPI from JSON

  should rename to: FriendObject or FriendJson
 */
class FriendAPI {
  final String asc, sun, moon;//, merc, ven, mars, jup, sat, ura, nep, plut;

  FriendAPI({this.asc, this.sun, this.moon,});
              /*
              this.merc, this.ven, this.mars,
              this.jup, this.sat, this.ura,
              this.nep, this.plut,});
              */

   factory FriendAPI.fromJson(Map<String, dynamic> json) {
     return FriendAPI(
        asc: json['asc'],
        sun: json['planets']['sun']['sign'],
        moon: json['moon'],
     );
   }  // FriendAPI.fromJson()

}