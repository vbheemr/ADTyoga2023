class UserChallengeData {
  bool isDone;
  String userId;
  List<int> posesDone;
  String timeStamp;

  UserChallengeData(this.isDone, this.userId, this.posesDone, this.timeStamp);

  Map<dynamic, dynamic> toJson(UserChallengeData userData) =>
      <dynamic, dynamic>{
        "isDone": userData.isDone,
        "userId": userData.userId,
        "posesDone": userData.posesDone,
        "timeStamp": userData.timeStamp,
      };
}
