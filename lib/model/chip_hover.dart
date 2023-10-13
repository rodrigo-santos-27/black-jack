class ChipHover {
  bool allHover = false;
  Map<String, bool> currentHover = {};

  void setAllHover(bool value) {
    allHover = value;
  }

  bool getAllHover() {
    return allHover;
  }

  void addCurrentHover(String key, bool value) {
    currentHover[key] = value;
  }

  bool? getCurrentHover(String key) {
    return currentHover[key];
  }

  void removeCurrentHover(String key) {
    currentHover.remove(key);
  }
}
