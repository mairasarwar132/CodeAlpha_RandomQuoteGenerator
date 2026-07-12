# QuoteFlow - Random Quote Generator

QuoteFlow is a premium Flutter random quote generator created for the CodeAlpha internship task. It displays a random inspirational quote on launch, lets users generate a new quote instantly, and presents the experience with a polished Material 3 interface.

## Features

- Random quote shown automatically on app launch
- New Quote action with no consecutive repeats
- 100+ local inspirational quotes
- Quote text and author presentation
- Clean Architecture folder structure
- Riverpod state management
- GoRouter navigation
- Material 3 light and dark themes
- Responsive mobile, tablet, and desktop layout
- AnimatedSwitcher fade and scale quote transitions
- Accessible live quote updates and semantic labels
- Local data only, with no API, Firebase, or database dependency

## Architecture

The app is organized by feature and responsibility:

```text
lib/
  core/
    constants/
    router/
    theme/
    utils/
    widgets/
  features/
    quotes/
      data/
        models/
        repository/
      presentation/
        providers/
        screens/
        widgets/
```

## Screenshots

Add production screenshots here after running the app on target devices.

| Light Theme | Dark Theme |
| --- | --- |
| Screenshot placeholder | Screenshot placeholder |

## Installation

```bash
flutter pub get
flutter run
```

## Quality Checks

```bash
dart format .
flutter analyze
flutter test
flutter build apk --debug
```

## Technologies Used

- Flutter
- Dart
- Riverpod
- GoRouter
- Google Fonts
- Material 3

## Dependencies

- `flutter_riverpod`
- `go_router`
- `google_fonts`
- `cupertino_icons`
- `flutter_lints`

## Author

Maira Sarwar 

## Future Improvements

- Favorite quotes
- Quote categories
- Share quote action
- Daily quote notification
- Offline screenshot export
