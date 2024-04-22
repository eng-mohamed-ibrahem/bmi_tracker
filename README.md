# BMI Tracker

BMI Tracker is a simple application that allows users to track their body mass index (BMI). The application is designed to work with Firebase Firestore database and Firebase authentication.

The application has three main screens:

1. **BMI Tracker**: This screen allows users to enter their weight and height and calculate their BMI. The user's BMI and BMI category (underweight, normal, overweight, obese) are displayed. Users can also view previous entries of their BMI.

2. **User Profile**: This screen allow user to logout.

3. **BMI Entries**: This screen displays a list of the user's previous BMI entries, along with the date and time they were recorded. Users can delete individual entries or clear all entries.

## Dependencies

The application depends on the following packages:

- `cloud_firestore: ^4.j15.8` - for interacting with Firebase Firestore database
- `connectivity_plus: ^6.0.2` - for checking the device's internet connectivity
- `firebase_auth: ^4.17.8` - for authentication with Firebase
- `firebase_core: ^2.27.0` - for initialization of Firebase
- `flutter_bloc: ^8.1.5` - for state management using BLoC pattern
- `freezed: ^2.3.2` - for generating code for immutable classes
- `get_it: ^7.6.7` - for dependency injection

## Usage

To use the application, follow these steps:

1. Clone the repository.
2. Run `flutter pub get` to fetch all the dependencies.
3. Run the application using `flutter run`.

The application is designed to work with Firebase Firestore database and Firebase authentication.

The application uses the BLoC pattern for state management. It demonstrates the usage of the `flutter_bloc` package for managing the state of the application.

The application uses Freezed to generate code for immutable classes. It demonstrates the usage of the `freezed` package for generating code for immutable classes with copy-with and equality operators.

The application also uses GetIt for dependency injection. It demonstrates the usage of the `get_it` package for managing dependencies in the application.

Overall, the application is a basic example of using Flutter and Firebase to build a BMI tracking app. It demonstrates the usage of various Flutter widgets, state management using BLoC pattern, and Firebase Firestore database for data storage. It also demonstrates the usage of GetIt for dependency injection and Connectivity Plus for checking internet connectivity.
