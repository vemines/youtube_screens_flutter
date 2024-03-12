rebuild:
	flutter clean
	flutter packages pub get
	flutter packages pub run build_runner build --delete-conflicting-outputs
	fluttergen -c pubspec.yaml

# generate image assets, colors, fonts
gen:
	flutter packages pub run build_runner build --delete-conflicting-outputs
	fluttergen -c pubspec.yaml

# flavors
buildWeb:
	flutter build web --release --no-tree-shake-icons




