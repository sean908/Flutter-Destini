/// 表示单个故事场景，包含故事内容和两个选项
class Story {
  final String storyTitle;
  final String choice1;
  final String choice2;

  Story({required this.storyTitle, required this.choice1, required this.choice2});
}