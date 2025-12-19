class CallModel {
  final String callId;
  final String callerId;
  final String receiverId;
  final String channelId;
  final String callType;
  final String status;

  CallModel({
    required this.callId,
    required this.callerId,
    required this.receiverId,
    required this.channelId,
    required this.callType,
    required this.status,
  });

  factory CallModel.fromMap(Map<String, dynamic> map, String id) {
    return CallModel(
      callId: id,
      callerId: map['callerId'],
      receiverId: map['receiverId'],
      channelId: map['channelId'],
      callType: map['callType'],
      status: map['status'],
    );
  }
}
