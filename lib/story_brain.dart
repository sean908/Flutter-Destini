import 'story.dart';

/// 故事控制器，管理故事流程和用户选择
class StoryBrain {
  // 故事数据集合
  final List<Story> _storyData = [
    Story(
        storyTitle:
        'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.'),
    Story(
        storyTitle: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.'),
    Story(
        storyTitle:
        'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        storyTitle:
        'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
        'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
        'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '')
  ];

  // 当前故事索引
  int _storyNumber = 0;

  /// 获取当前故事
  Story getStory() {
    return _storyData[_storyNumber];
  }

  /// 获取选项1文本
  String getChoice1() {
    return getStory().choice1;
  }

  /// 获取选项2文本
  String getChoice2() {
    return getStory().choice2;
  }

  /// 根据用户选择进入下一个故事
  void nextStory(int choice) {
    // 使用映射表定义故事转换逻辑
    final Map<int, Map<int, int>> storyFlow = {
      0: {1: 2, 2: 1},
      1: {1: 2, 2: 3},
      2: {1: 5, 2: 4},
    };

    if (storyFlow.containsKey(_storyNumber) && 
        storyFlow[_storyNumber]!.containsKey(choice)) {
      _storyNumber = storyFlow[_storyNumber]![choice]!;
    } else {
      restart();
    }
  }

  /// 重置故事到初始状态
  void restart() {
    _storyNumber = 0;
  }

  /// 判断选项2按钮是否应该显示
  bool buttonShouldBeVisible() {
    // 在故事0、1、2中显示选项2按钮
    return _storyNumber <= 2;
  }
}