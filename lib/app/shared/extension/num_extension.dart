extension Convert on double {
  int opacityToAlpha() => (255 * this).ceil();
}
