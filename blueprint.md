
# Project Blueprint

## Overview

This document outlines the plan for creating a Flutter application. The goal is to build a beautiful and intuitive user interface that is mobile responsive and adapts to different screen sizes, working perfectly on mobile and web.

## Implemented Features

### Initial Setup
- **Project Initialization:** A new Flutter project has been created.
- **Git Repository:** The project has been connected to the remote Git repository at `https://github.com/bibslondon/FF-WIN-V2`.

## Current Plan

The current plan is to replace the boilerplate Flutter code with a more visually appealing and interactive design. The following steps will be taken:

1. **Add Dependencies:**
   - `google_fonts` for custom typography.
   - `provider` for state management (specifically for theme toggling).

2. **Create a Theming System:**
   - Implement a `ThemeProvider` to manage light and dark themes.
   - Define `ThemeData` for both light and dark modes using `ColorScheme.fromSeed` with a custom seed color.
   - Use `google_fonts` to create a custom `TextTheme`.
   - Customize the `AppBarTheme` and `ElevatedButtonTheme` for a consistent look and feel.

3. **Update the Main Application:**
   - Wrap the root of the application with a `ChangeNotifierProvider` to make the `ThemeProvider` available throughout the widget tree.
   - Use a `Consumer` to rebuild the `MaterialApp` when the theme changes.
   - Set up the `MaterialApp` to use the custom light and dark themes.

4. **Redesign the Home Page:**
   - Create a `MyHomePage` widget with a more modern and visually appealing layout.
   - Add a theme toggle button to the `AppBar` to switch between light and dark modes.
   - Include a system theme button in the `AppBar`.
   - Use a variety of text styles from the custom `TextTheme`.
   - Add an `ElevatedButton` with the custom theme.

This plan will create a solid foundation for the application with a robust theming system and a more engaging user interface.
