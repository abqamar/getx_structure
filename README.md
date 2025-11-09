# 🧱 Flutter Clean Architecture (GetX + MVVM)

A production-ready Flutter boilerplate using **GetX**, following a strict **Clean Architecture + MVVM** pattern.

This template is designed to scale for real apps — it includes:
- 🌍 Multi-language localization (English, Arabic, Urdu, French)
- ⚙️ Clean separation of Data / Domain / Presentation layers
- 🌗 Dark–Light theme switching (persisted)
- 🌐 Internet connectivity monitoring
- 🔒 Centralized error handling (Server, Timeout, No Internet)
- 💡 MVVM pattern with GetX controllers and reactive UI
- 🧩 GetConnect HTTP client with fail-safe wrapper
- 🧠 Domain-driven use cases & entities
- 🧭 Route bindings and dependency injection via GetX
- ✅ Fully extensible for new modules

---

## 🧩 Architecture Overview

lib/
├─ core/ # Core utilities: theme, network, error, config
│ ├─ errors/ # Exception → Failure mapping
│ ├─ network/ # GetConnect client, connectivity
│ ├─ theme/ # Light/Dark themes + ThemeService
│ └─ utils/ # Logger and helpers
│
├─ data/ # Data sources + repository implementations
│ ├─ models/
│ ├─ providers/
│ └─ repositories/
│
├─ domain/ # Business logic (entities, repos, usecases)
│ ├─ entities/
│ ├─ repositories/
│ └─ usecases/
│
├─ presentation/ # UI + ViewModels (controllers)
│ ├─ bindings/
│ ├─ controllers/
│ ├─ pages/
│ ├─ routes/
│ └─ widgets/
│
├─ services/ # App-wide services (storage, localization)
├─ localization/ # i18n translations
└─ main.dart / app.dart

```yaml

---

## 🏗️ Tech Stack

| Category | Technology |
|-----------|-------------|
| State Management | [GetX](https://pub.dev/packages/get) |
| Architecture | Clean + MVVM |
| Networking | GetConnect |
| Storage | GetStorage |
| Theming | Material 3, ThemeService |
| Localization | GetX Translations |
| Connectivity | connectivity_plus |
| Error Handling | Failure/Exception Mapping |
| Language | Dart / Flutter 3.24+ |

---

## 🚀 Getting Started

### 1️⃣ Clone the Repo
```bash
git clone https://github.com/<your-username>/flutter_clean_getx_mvvm.git
cd flutter_clean_getx_mvvm
```

## Install Dependencies
```bash
flutter pub get
```

## Run the App
```bash
flutter run
```

## ⚙️ Features
🧠 MVVM Pattern
- View: `presentation/pages`
- ViewModel: `presentation/controllers`
- Model: `data/models`, `domain/entities`

🌐 Network Layer
- AppGetConnect wraps GetConnect with error & timeout handling
- Exceptions mapped into typed Failures
- Repositories return `Either<Failure, Data>` using dartz

📴 Connectivity
- `ConnectivityService` watches online/offline state
- UI auto-refreshes when back online

🧭 Navigation
- Route control via `AppPages` and `Bindings`
- Dependency injection powered by `Get.put` & `Bindings`

🌗 Theming
- `ThemeService` persists user’s theme choice
- Material 3 dynamic color scheme

🌍 Localization
Supports English, Arabic, Urdu, French
Automatically switches RTL for Arabic/Urdu.
Language persists via `LocalizationService`.

```dart
Text('home.title'.tr); // automatic translation
```

```dart
Get.find<LocalizationService>().updateLocale(Locale('ar', 'AE'));
```

## 🧑‍💻 Contributing
Contributions are welcome!
Please fork this repo, make your changes, and submit a pull request.

## 📜 License
This project is licensed under the MIT License — see the LICENSE

## 🌟 Acknowledgments
- [GetX](https://pub.dev/packages/get) - by Jonny Borges
- [Flutter Community](https://flutter.dev/community])
