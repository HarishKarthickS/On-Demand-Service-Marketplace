# 🚀 On-Demand Service Marketplace

## Overview
The On-Demand Service Marketplace is a cross-platform mobile application built with **Flutter** that connects users with local service providers for a variety of services such as plumbing, electrical work, cleaning, and more. Users can browse service providers, view detailed information, and book a service directly through the app. The backend API, built with **Node.js** and **Express**, handles provider data and booking requests.

---

## Features

### Mobile App (Flutter)
- **Browse Service Providers:** View a list of available service providers along with key details.
- **Provider Details:** Access detailed information including name, category, rating, and a description.
- **Service Booking:** Book a service by providing your name and selecting a scheduled date.
- **Intuitive UI:** Simple and user-friendly interface designed for ease-of-use.

### Backend API (Node.js + Express)
- **RESTful API Endpoints:** Retrieve provider data and create new booking entries.
- **In-Memory Data Storage:** For demonstration purposes (ideal for prototyping).
- **CORS Enabled:** Ensures smooth communication between the mobile app and backend.

---

## Tech Stack

### Frontend
- **Flutter (Dart):** For building the cross-platform mobile application.
- **HTTP Package:** For making API requests to the backend.

### Backend
- **Node.js:** JavaScript runtime for the backend.
- **Express.js:** Web framework for building RESTful APIs.
- **CORS:** Middleware for handling Cross-Origin Resource Sharing.

---

## Project Structure

```
on_demand_service_app/
├── pubspec.yaml               # Flutter project configuration
└── lib/
    ├── main.dart              # App entry point
    ├── models/
    │   ├── provider.dart      # Service provider model
    │   └── booking.dart       # Booking model
    ├── screens/
    │   ├── home_screen.dart               # Lists service providers
    │   ├── provider_details_screen.dart   # Shows provider details
    │   └── booking_screen.dart            # Booking form
    └── services/
        └── api_service.dart   # Handles API calls

on_demand_service_backend/
├── package.json               # Node.js project configuration
└── index.js                   # Express server and API endpoints
```

---

## Installation & Setup

### Backend Setup (Node.js API)
1. **Prerequisites:** Ensure [Node.js](https://nodejs.org/) is installed on your machine.
2. **Navigate to the backend directory:**
   ```bash
   cd on_demand_service_backend
   ```
3. **Install Dependencies:**
   ```bash
   npm install
   ```
4. **Start the Server:**
   ```bash
   npm start
   ```
   The backend API should now be running at `http://localhost:3000`.

---

### Frontend Setup (Flutter App)
1. **Prerequisites:** Ensure the [Flutter SDK](https://flutter.dev/docs/get-started/install) is installed.
2. **Navigate to the Flutter project directory:**
   ```bash
   cd on_demand_service_app
   ```
3. **Install Flutter Dependencies:**
   ```bash
   flutter pub get
   ```
4. **Run the App:**
   ```bash
   flutter run
   ```
   The mobile app will launch on your connected emulator or device.

---

## API Documentation

### GET /providers
**Description:** Retrieve a list of available service providers.

**Request:**
```
GET /providers HTTP/1.1
Host: http://localhost:3000
```

**Response:**
```json
[
  {
    "id": 1,
    "name": "John's Plumbing",
    "category": "Plumbing",
    "rating": 4.5,
    "description": "Experienced plumbing services for all your home needs."
  },
  {
    "id": 2,
    "name": "Elite Electricians",
    "category": "Electrical",
    "rating": 4.7,
    "description": "Professional electrical services for residential and commercial projects."
  },
  {
    "id": 3,
    "name": "Sparkle Cleaning",
    "category": "Cleaning",
    "rating": 4.3,
    "description": "Reliable cleaning services to keep your home or office spotless."
  }
]
```

---

### POST /bookings
**Description:** Create a new booking for a service provider.

**Request:**
```
POST /bookings HTTP/1.1
Host: http://localhost:3000
Content-Type: application/json
```

**Body:**
```json
{
  "providerId": 1,
  "userName": "Jane Doe",
  "scheduledDate": "2025-02-15"
}
```

**Response:**
```json
{
  "id": 1,
  "providerId": 1,
  "userName": "Jane Doe",
  "scheduledDate": "2025-02-15"
}
```

---

## Future Enhancements
- **User Authentication:** Implement secure login and account management.
- **Database Integration:** Transition from in-memory storage to a persistent database (e.g., MongoDB).
- **Advanced Booking Management:** Allow booking cancellations, rescheduling, and history tracking.
- **Push Notifications:** Send reminders for upcoming bookings and service updates.

---

## Contributors

| Name           | Role           | Contact                   |
| -------------- | -------------- | ------------------------- |
| **Harish Karthick S**  | Developer      | harish.s@kalvium.community    |


---

## License
This project is licensed under the MIT License. Feel free to use, modify, and distribute.

---

## Support & Contribution
If you'd like to contribute:
- **Fork** the repository.
- Create a **new branch** for your feature or bug fix.
- Make your **changes**.
- Submit a **Pull Request**.

For any issues or feature requests, please open an issue on the GitHub repository. Your support and contributions are greatly appreciated!

---

Happy Coding! 🚀

