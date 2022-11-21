import 'package:json_annotation/json_annotation.dart';

part 'dashboard.g.dart';

@JsonSerializable()
class Dashboard {
  String? studySessionId;
  num? score;
  String? questionTitle;
  String? questionDescription;
  String? topicId;
  String? firstEnglish;
  String? translation;
  bool? isOpen;
  String? japanese;

  Dashboard(
      {this.studySessionId,
      this.score,
      this.questionTitle,
      this.questionDescription,
      this.topicId,
      this.firstEnglish,
      this.translation,
      this.isOpen,
      this.japanese});

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardToJson(this);
}
