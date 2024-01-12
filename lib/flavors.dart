enum Flavor {
  dev,
  prod,
  qa,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Dev GetX Tutorial App';
      case Flavor.prod:
        return 'Prod GetX Tutorial App';
      case Flavor.qa:
        return 'QA GetX Tutorial App';
      default:
        return 'title';
    }
  }

}
