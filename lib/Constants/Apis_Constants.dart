

class Apis{

// ip
static String ip="http://192.168.203.87:3001";
// BaseUrl
static String baseurl="$ip/api";

//..........................Authentication Api endpoints
  static String Login="$baseurl/user/login";
  static  String verifyotp="$baseurl/user/verify-otp";
  static  String googlelogin="$baseurl/user/google-login";
  static  String sendotp="$baseurl/user/send-otp";
  static  String changepassword="$baseurl/user/changepassword";

//.........................Profile..............................
  static String Profile="$baseurl/user/profile";
  static String GalleryList="$baseurl/gallery/list";
  static String GalleryUpload="$baseurl/gallery/upload";
  static String EditeProfile="$baseurl/user/update";
  static String TotalActivity="$baseurl/activity/created-activities-count";
  static String TotalMatch="$baseurl/mate/total-mates";
  static String JoinedActivites="$baseurl/activity/joined-activities-count";
  static String userMatches="$baseurl/mate/liked-mates";
  static String ListJoinedActivites="$baseurl/activity/user-activities";








//.........................Mates profileView.....................
  static String MateProfile="$baseurl/privacy/profile";


//......................... Mates...............................
  static String Mates="$baseurl/mate/filter";
  static String nearbyMates="$baseurl/mate/nearby";
  static String MatesList="$baseurl/user/List";
  static String ViewbyDistance="$baseurl/mate/find-nearby-mates";
  static String MatchMates="$baseurl/user/match";
  static String NearbyFilter="$baseurl/user/search";
  static String LikedMate="$baseurl/mate/like";




//.........................Activity..............................
  static String dailyactivities="$baseurl/activity/daily-activities";
  static String ActivityList="$baseurl/activity/list";
  static String CreateActivity="$baseurl/activity/create-activity";
  static String DetailActivity="$baseurl/activity/activity-details";
  static String EventDetails="$baseurl/bussness/list";
  static String MyActivity="$baseurl/activity/my-activity";
  static String joinActivity="$baseurl/activity/join";
  static String joinEvent="$baseurl/bussness/joinEvent";
  static String saveActivity="$baseurl/activity/save";
  static String saveEvent="$baseurl/bussness/saveEvent";
  static String saveList="$baseurl/bussness/saveList";
  static String FilterActivites="$baseurl/activity/search";
  static String LeaveActivites="$baseurl/activity/leave";
  static String LeaveEvent="$baseurl/bussness/leaveEvent";
  static String UpdateActivity="$baseurl/activity/update";
  static String DeleteActivity="$baseurl/activity/delete";



//......................privacyPolicy..............................
  static String UpdatePolicy="$baseurl/privacy/updatePrivacy";
  static String Getprivacy="$baseurl/privacy/getPrivacySettings";


//..........................Chats....................................
  static String StartConverstaion="$baseurl/message/send";
  static String GetChatsList="$baseurl/message/cheatlist";
  static String grouplist="$baseurl/message/grouplist";
  static String Markasread="$baseurl/message/markAsRead";













}