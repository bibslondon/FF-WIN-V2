
# Project Blueprint

## Overview

This is a Flutter application integrated with Firebase. The application is configured for Android, iOS, and web platforms. It includes a basic theme with support for light and dark modes, and uses custom fonts from the `google_fonts` package. The app now has a complete authentication system using Firebase Authentication.

## Features

* **Firebase Integration:** The project is connected to a Firebase project with support for Android, iOS, and web.
* **Theming:** The application uses a Material 3 theme with a custom color scheme and typography. It supports both light and dark modes, and the theme can be toggled by the user.
* **Custom Fonts:** The app uses the `google_fonts` package to apply custom fonts to the text styles.
* **State Management:** The `provider` package is used for state management, for both the theme and the authentication service.
* **Authentication:** A complete authentication system is implemented using Firebase Authentication, including:
    * **Email & Password Login:** Users can sign in with their email and password.
    * **Email & Password Signup:** Users can create a new account with their email and password.
    * **Session Persistence:** The user's session is persisted across app restarts.
    * **Logout:** Users can sign out of their account.

## Project Structure

* `lib/main.dart`: The main entry point of the application. It initializes Firebase, sets up the theme, provides the `AuthService` and defines the root widget of the app.
* `lib/firebase_options.dart`: This file contains the Firebase configuration for all supported platforms.
* `lib/src/features/auth/screens/login_screen.dart`: The UI for the login screen.
* `lib/src/features/auth/screens/signup_screen.dart`: The UI for the signup screen.
* `lib/src/features/auth/screens/auth_wrapper.dart`: A widget that listens to the authentication state and displays the appropriate screen (Login or Home).
* `lib/src/features/auth/services/auth_service.dart`: The business logic for authentication, handling all interactions with Firebase Authentication.
* `lib/src/features/home/screens/home_screen.dart`: The main screen of the app after a user has logged in.
* `pubspec.yaml`: This file defines the project's dependencies, including `firebase_core`, `firebase_auth`, `provider`, and `google_fonts`.

## Last Task: Authentication System Implementation

### Plan

1.  **Add `firebase_auth` dependency:** Add the `firebase_auth` package to the `pubspec.yaml` file.
2.  **Create file architecture:** Set up the folder structure for the authentication feature.
3.  **Implement authentication service:** Create the `AuthService` class with methods for signing in, signing up, signing out, and listening to authentication state changes.
4.  **Create UI screens:** Develop the `LoginScreen`, `SignUpScreen`, and `HomeScreen`.
5.  **Configure routing and state management:** Create an `AuthWrapper` to handle navigation based on the user's authentication state.
6.  **Update `main.dart`:** Integrate the `AuthWrapper` as the home widget and provide the `AuthService`.

### Execution

*   The `firebase_auth` package was successfully added to the project.
*   The directory structure for the authentication feature was created.
*   The `AuthService` was implemented, handling all interactions with Firebase Authentication.
*   The `LoginScreen`, `SignUpScreen`, and `HomeScreen` were created with a clean and functional UI.
*   The `AuthWrapper` was implemented to manage the user's authentication state.
*   `main.dart` was updated to use the `AuthWrapper` and provide the `AuthService` to the widget tree.
