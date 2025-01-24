# login_app

A new Flutter project.

## Approach:

- Utilized the `http` package to simulate API interactions, ensuring a realistic login process.
- Incorporated `Provider` for efficient state management, enabling smooth data sharing across screens.
- Followed a modular approach to ensure clean, maintainable, and scalable code.
- Used pre-configured mock API responses to display profile data.
- Created small widgets to improve code.

## Assumptions:

- Used static credentials `[Email: user@speedforce.com, Password: password]` to demonstrate the login process.
- Displayed error and welcome message regarding credentials.
- A mock signup process simulates user registration without an actual backend service to checks if all fields are filled.

## Design and Architectural Decisions:

- Used Provider to manage user state across screens.
- Separated UI components from business logic to maintain a clean codebase and simplify future enhancements.
- Designed screens to be responsive and adhere to Figma-provided UI guidelines for a consistent and visually appealing experience.

## Screenshots

| Auth Validation | Home Screen | Profile Screen |
|:-:|:-:|:-:|
| ![Auth Validation](https://github.com/user-attachments/assets/a8e78b13-64c1-47d8-9f43-5870cdd90398) | ![Home Screen](https://github.com/user-attachments/assets/d5fb13b5-9d3a-4783-bcbd-dfd7b32b611c) | ![Profile Screen](https://github.com/user-attachments/assets/4ae1be96-c3b9-4429-91df-77870973fd96) |
