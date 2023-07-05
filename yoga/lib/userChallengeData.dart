class UserChallengeData {
  final bool isDone;
  final String userId;
  final List<int> posesDone;
  final String timeStamp;

  UserChallengeData(this.isDone, this.userId, this.posesDone, this.timeStamp);

  Map<dynamic, dynamic> toJson(UserChallengeData userData) =>
      <dynamic, dynamic>{
        "isDone": userData.isDone,
        "userId": userData.userId,
        "posesDone": userData.posesDone,
        "timeStamp": userData.timeStamp,
      };
}
