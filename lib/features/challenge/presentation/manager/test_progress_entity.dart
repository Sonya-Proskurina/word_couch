class TestProgressEntity {
  int _correct = 0;
  int _incorrect = 0;
  int _skipped = 0;

  int getCorrect() => _correct;
  int getIncorrect() => _incorrect;
  int getSkipped() => _skipped;

  void addCorrect() {
    _correct++;
  }

  void addIncorrect() {
    _incorrect++;
  }

  void addSkipped() {
    _skipped++;
  }
}
