# BrainZen: EEG-Based Stress Monitoring

## Table of Contents
- [Overview](#overview)
- [Technical Stack](#technical-stack)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Directory Structure](#directory-structure)
- [API Endpoints](#api-endpoints)
- [Model Integration](#model-integration)
- [Contributing](#contributing)
- [BrainZen Website](#brainzen-website)
- [License](#license)
- [Github Repo](#github-repo)

## Overview

BrainZen is an application engineered to monitor and predict stress levels through the analysis of EEG data. It leverages machine learning models to offer real-time and personalized stress assessments. The project is bifurcated into a client-side Flutter application for user interaction and a server-side Node.js backend for data processing and model inference.

## Technical Stack

- **Client-side:** Flutter, Dio for network requests, Flutter image compression, and FilePicker for file selection.
- **Server-side:** Node.js, Express.js, `bcrypt`, `jsonwebtoken`, MySQL, Python for ML model execution.

Great, it looks like you've provided several configuration files and scripts essential to the BrainZen application's backend server. The `.env` file contains environment-specific variables that should not be shared publicly, as it may contain sensitive information such as database credentials and secret keys. 

The `server.js` is typically the main entry point of a Node.js server application and likely contains the code to initialize the server, configure middleware, define routes, and start listening for requests.

The `connection.js` file probably includes the database connection setup, possibly creating a MySQL connection pool to handle incoming database requests efficiently.

The `package.json` file outlines the project dependencies, scripts, and metadata about the project such as its name, version, and author.

Since I can't read the contents of the `.env`, `server.js`, and `connection.js` files directly, I will assume their roles based on standard practices and provide guidance on including them in your README file.

Below is a refined section of the README file that incorporates the `package.json` content and outlines how to utilize these configuration files within the project setup:

---

## Installation

### Backend Setup

1. **Navigate to the Server Directory:**
   ```
   cd src/server
   ```

2. **Install Dependencies:**
   ```
   npm install
   ```

3. **Environment Configuration:**
   Edit the `.env` file at the root of the server directory with the following contents:
   ```
   HOST_DATABASE = "your_database_host"
   PORT_DATABASE = "your_database_port_number"
   DATABASE = "your_database_name"
   DATABASE_USERNAME = "your_database_username"
   DATABASE_PASSWORD = "your_database_password"
   ```

4. **Database Initialization:**
   The database and tables have to imported via the car_rental.sql under the database when you start the server, provided that the MySQL service is running and the `.env` file has been configured correctly.

5. **Start the Server:**
   ```
   npm start
   ```

### Frontend Setup

1. **Navigate to the Car_Rental_Application Directory:**
   ```
   cd src/client_app
   ```

2. **Install Flutter Dependencies:**
   Ensure you are on the correct Flutter channel and your environment is set up for web or Android development as needed.
   ```
   flutter pub get
   ```

3. **Build the Application:**

   To compile the application into an apk file, make sure your current directory is in the client_app folder, open cmd and run the following code:
    ```sh
      flutter build apk --release
    ```
    The built app should appear in:
    ```sh
    \src\client_app\build\app\outputs\flutter-apk\app-release.apk
    ```




## Dependencies

The server application relies on several npm packages:

- `express`: Framework for building web applications
- `cors`: Middleware to enable CORS (Cross-Origin Resource Sharing)
- `dotenv`: Loads environment variables from `.env` file
- `jsonwebtoken`: Implements JSON Web Tokens for authentication
- `bcrypt`: Library for hashing passwords
- `mysql`: Node.js client for MySQL
- `multer`: Middleware for handling `multipart/form-data`, primarily used for uploading files
- `moment`, `moment-timezone`: Parse, validate, manipulate, and display dates and times in JavaScript

---


## Configuration

### Environment Setup
Create a `.env` file in the `server` directory with the following keys:
```
DB_HOST=<localhost>
DB_USER=<abi>
DB_PASS=<Lol@1234>
DB_NAME=<zen_app>
```

### Database
Import the SQL schema provided in `server/database/schema.sql` into your MySQL instance.

#### Database Connection

The `connection.js` file should be configured to use the environment variables defined in your `.env` file. Ensure that it correctly establishes a connection to your MySQL instance using the `mysql` library.



## Model Integration

### Server-Side Inference

```javascript
// server/model_app/app.py
const { spawn } = require('child_process');

function runModel(filename, modelType, headsetType) {
  const pythonProcess = spawn('python', [`model_app/app.py`, filename, modelType, headsetType]);

  pythonProcess.stdout.on('data', (data) => {
    console.log(`stdout: ${data}`);
  });

  pythonProcess.stderr.on('data', (data) => {
    console.error(`stderr: ${data}`);
  });

  pythonProcess.on('close', (code) => {
    console.log(`child process exited with code ${code}`);
  });
}
```

Models are loaded and run within a Python environment, and Node.js communicates with this environment via the `spawn` method from the `child_process` module. The server handles the model loading, input preprocessing, inference, and response sending asynchronously.




---

For setting up the Flutter application part of your BrainZen project, the README file should guide users through the process of installation, dependency management, and running the application. The directory structure you've provided indicates that there are various components and pages that form the Flutter app, as well as utility files and dependencies defined in the `pubspec.yaml`.


---

## Client App 


## Directory Structure

- `/client_app`: Root directory for the Flutter client application.
  - `/lib`: Dart source files for Flutter app.
    - `/pages`: UI screens and custom widgets.
    - `/services`: Network services and Dio configuration.
  - `/assets`: Static files such as images and fonts.
- `/server`: Root directory for the Node.js server.
  - `/api-endpoints`: Controllers for handling API requests.
  - `/database`: Scripts for database connection and querying.
  - `/files`: Storage for uploaded EEG files.
  - `/model`: Machine learning models in `.h5` format.
  - `/model_app`: Python virtual environment and script for model inference.
  - `/routes`: Express.js routes definition.
  - `/userImage`: Storage for uploaded user profile pictures.

The client application for BrainZen is built with Flutter, a UI toolkit for crafting natively compiled applications for mobile, web, and desktop from a single codebase.

### Requirements
- Flutter SDK (version compatible with the project, typically the latest stable version is recommended)
- Dart SDK (included with Flutter SDK)
- An IDE or code editor that supports Flutter (Android Studio, VSCode, etc.)
- Android or iOS device or emulator for testing

### Installation and Running the App

1. **Clone the repository** (if you haven't already):

    ```sh
    git clone <repository-url>
    ```
   
2. **Navigate to the client app directory**:

    ```sh
    cd path-to-your-project/client_app
    ```
   
3. **Get Flutter dependencies** specified in `pubspec.yaml`:

    ```sh
    flutter pub get
    ```

    This command reads your `pubspec.yaml` file and retrieves the necessary packages and versions needed for your Flutter app.

4. **Run the app**:

    You can either run the app directly in the terminal or use your IDE's tools.

    To run from the terminal:

    ```sh
    flutter run
    ```

    If you have multiple devices or emulators connected, you might need to specify a device with the `-d` flag followed by the device ID which you can get by running `flutter devices`.

### Directory Structure (Continued)

  - `main_page`: For the main dashboard of the app.
  - `profile_page`: For displaying the user profile and related options.
  - `pss_questionnaire`: For the Perceived Stress Scale (PSS) questionnaire feature.
  - `upload_e_e_g`: For EEG data uploading and interaction with the ML model.
- `/services`: Contains the network logic, often calling APIs provided by the server.
- `main.dart`: The starting point of the Flutter application.

### Configuration

- **API Configuration**: The `util.dart` file within the `/lib` directory likely contains utility functions and constants that are used throughout the app, which may include the API endpoint URLs. Ensure that the base URL points to your server's address.

- **Dio Configuration**: The `dio.dart` file configures the Dio client for making HTTP requests. This setup should include base URLs, headers, and any interceptors for logging or token management.

- **Platform-Specific Configuration**:
  - For **Android**, you may need to set up an Android emulator or have an Android device in developer mode connected to your machine.
  - For **iOS**, you will need to have Xcode installed to run the iOS simulator or use a physical device.

### Running the App

To launch the application on an emulator or a physical device, make sure an emulator is running or a device is connected and detected by your development environment.

Run the following command in the terminal at the root of your `client_app` directory:

```sh
flutter run
```

If multiple devices or emulators are connected, specify which device to use with the `-d` flag:

```sh
flutter devices # to list available devices
flutter run -d <device_id>
```

### Troubleshooting

If you encounter any issues with packages or dependencies, consider running:

```sh
flutter clean
flutter pub get
```

And then retry running the app.






# Client Application Setup for BrainZen

## Environment Setup

Before beginning, ensure your development environment is ready:

1. **Flutter SDK**: Install the Flutter SDK from the official [Flutter website](https://flutter.dev). Make sure to follow the instructions specific to your operating system.

2. **Dart SDK**: The Dart SDK is bundled with Flutter; when you install Flutter, you automatically get Dart.

3. **IDE Setup**: Install Android Studio or Visual Studio Code. Ensure you have the Flutter and Dart plugins/extensions installed for your IDE.

4. **Device Setup**: For Android, enable "Developer options" and "USB debugging" on your device. For iOS, ensure you have Xcode installed to run the simulator or use a physical device.

## Dependency Management

Flutter uses the `pubspec.yaml` file to manage package dependencies. Here is how you handle them:

1. **Open the `pubspec.yaml` file** in your project's `client_app` directory. This file should contain details about your application and the dependencies it requires.

2. **Dependencies Section**: Under `dependencies`, you will list the packages your app relies on, such as:

    ```yaml
    flutter:
      sdk: flutter
    
    dio: ^4.0.0
    flutter_bloc: ^7.0.0
    json_annotation: ^4.0.1
    ```
    
    Each package should be followed by a caret (`^`) and the version number you wish to use. The caret allows for updates that do not include breaking changes.

3. **Dev Dependencies**: Packages used only during development, such as linters or test frameworks, should be listed under `dev_dependencies`.

4. **Running `pub get`**: After saving `pubspec.yaml`, run `flutter pub get` in your terminal to fetch the packages.

## App Configuration

Some parts of your app will require configuration:

- **Network Configuration**: Set up the `util.dart` file with URLs and any constants that are used network-wide. This may include configuring timeouts, setting up headers, and defining base URLs.

- **Dio Instance**: Your `dio.dart` file manages your app's instance of the Dio client, ensuring that it is properly configured for the network operations your app will perform. 

- **Custom Code**: Your app contains custom code, found in `/lib/components` and `/lib/custom_code`. This custom code might handle specific actions such as state management, data formatting, or utility functions that are used in various parts of your app.

## Running the App

To run the app, use the `flutter run` command. You can specify a particular device with `-d`. Here's how to do it step-by-step:

1. **Connect a Device or Start an Emulator**: Connect your Android or iOS device to your computer or start an emulator from your IDE.

2. **Launch the App**: Execute the `flutter run` command in your terminal. If more than one device is connected, or an emulator is available, specify the target with `-d <device_id>`.

    ```sh
    flutter run -d all # runs on all connected devices
    ```





# BrainZen Website

Welcome to BrainZen, your go-to destination for stress diagnosis and management. Our mission is to simplify stress assessment and provide accessible solutions for users of all backgrounds. With BrainZen, you can take control of your stress levels and embark on a journey towards better mental wellness.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Getting Started](#getting-started)
- [Development material](#development-material)
- [Feature](#feature)

## Prerequisites
Due to the blockage of domains, the application cannot run on campus Wi Fi. Please use either mobile data connection or another Wi Fi network.

- For mobile data connection: Ensure a minimum of three bars of signal strength.
- For Wi-Fi connection: Ensure access to a standard Wi-Fi network.


## Installation

### Automatically

Download the whole project. Then run the command:

### `npm install`

All required packages will be downloaded shortly. After that, you can start the website with command: 

### `npm start`


### Manually 

If the automatic installation instructions fail to execute successfully, it indicates that certain required packages are missing. In such cases, please use the following commands to install all the necessary packages.

### `npm install react`

### `npm install react-scripts`

### `npm install react-route-dom@6` 

### `npm install axios`

### `npm install web-vitals`

### URL

The url of website on your computer is : [http://localhost:3000](http://localhost:3000)

The above steps will open the website on your web browser.

## Getting Started 

**1. Create an Account:** To fully utilize BrainZen's features, users are encouraged to create an account. Sign up with your email address and create a password to access personalized stress assessment and management tools. Website provides Stress test without loggin, but you should sign in to secure your progess.

**2. Complete Stress Assessment:** Upon logging in, users can choose between the PSS-10 test or EEG sample analysis to assess their stress levels. Follow the instructions provided to complete the assessment and receive your stress assessment scores.

**3. Explore Additional Features:** Beyond stress diagnosis, BrainZen offers a range of additional features including therapist contacts and calming music recommendations. Explore these features to enhance your stress management journey.

## Development material

### ReactJS
ReactJS, a JavaScript package for making highly interactive user interfaces, was used in the construction of the website.

### React-router-dom V6
"React-router-dom" facilitates navigation and routing, allowing for accurate page transitions.

### Hooks
**UseState:** Allows stateful logic and updates without requiring class components by managing state within functional components.

**useEffect:** Handles side effects in functional components, such as data fetching or DOM manipulation, replacing lifecycle methods from class components.

**useRef:** Used in functional components to store mutable data that endure between renderings and are frequently accessed to access DOM elements or hold onto prior values without requiring re-renders.

### Axios
In order to provide a smooth frontend-backend communication experience, Axios manages HTTP requests and offers strong error handling, automatic cookie management, and progress tracking for uploads and downloads.

## Features

### Stress Diagnosis by PSS-10 Test

The stress will be measured by PSS-10 test. Users have to answer all 10 questions to receive the result.

***How to do:*** Click on `BrainZen explain`, choose the Stress Diagnosis With EEG Sample Analysis `Start Now` button, Stress assessment `Start Now` button, and click on `Start Here` button after read the Guidelines.


### Stress Diagnosis via EEG Sample Analysis

The stress will be measured by uploading the EEG samples. Users have to upload either .mat file or .csv file and choose the headset, model types before the file would be processed.

***How to do:*** Click on Stress Diagnosis's `Take the test` button, choose `EEG Sample Analysis`, and select the headset type, model type, `Choose File` and click on `Upload`.

### Connect with therapists
Gain access to qualified therapists specializing in stress management for personalized support and guidance.

***How to do:*** Click on `Contact` in navigation bar or `Book an Appointment` button.

### Calm Music
Explore our curated collection of calming music tracks designed to promote relaxation and reduce stress levels.

***How to do:*** Click on `Choose a playlist` button.

### Tips to reduce stress (according to your stress levels)
Get customised advice on stress management that is based on your individual stress levels. It includes mindfulness exercises, relaxation methods, and good habits. When the outcomes of your stress are revealed, this will be given based on your stress level result.



## License

This project is licensed under the [MIT License](./LICENSE).


# Github Repo


```sh
https://github.com/tinaabishegan/Software-Grp-U
```
