# pixelforce

This is a Flutter pixelforce app built using design from the Explore tab on Figma:
https://www.figma.com/file/vtIAbUhIVhDqDjtpOCl74V/Front-End-Example?type=design&node-id=403%3A124&mode=dev

## Getting Started

This app is built on Flutter 3.16.3. A quick tool to handle flutter version is to
use [fvm](https://fvm.app/). Check out the installation
guide [here](https://fvm.app/docs/getting_started/installation). Once installed, you can run the
following commands to install and use a specific Flutter SDK version:

### Install Flutter version (via fvm):

```
Usage:
fvm install - # Installs version found in project config
fvm install {version} - # Installs specific version
Option:
-h, --help Print this usage information.
-s, --skip-setup Skips Flutter setup after install
```

### Switching/using Flutter version (via fvm):

```
Usage:
fvm use {version}
Option:
-h, --help Print this usage information.
-f, --force Skips Flutter project checks.
-p, --pin Pins latest release channel instead of channel itself.
--flavor Sets version for a project flavor
```

**Note:** You must run your flutter commands starting with **fvm**.

### Running the app

Before running the app, make sure to check the Dart and Flutter SDK path in your project setting.

For Dart SDK path: `/Users/<user>/fvm/versions/3.16.3/bin/cache/dart-sdk`

For Flutter SDK path: `/Users/<user>/fvm/versions/3.16.3`

Then, make sure to run the following commands to get all dependencies
and generate necessary freezed models.

```
fvm flutter pub get
fvm flutter pub run build_runner build --delete-conflicting-outputs --fail-on-severe
```

Click Debug or Run, and play around!! :)

### Challenges

1. Figuring out the data model used across the different rows.
2. Choosing a loading state, and I thought the quickest approach was to just use a circular progress
   indicator.
3. Deciding which components can be reused for future implementations.

### Implementation approach

I decided to keep is as simple as possible. I maintained the need for reusable components, and emphasising 
on project structure and tidiness.

### End Result
![Simulator Screen Recording - iPhone 15 - 2024-01-19 at 16 39 45](https://github.com/jasonwenlee/pixelforce/assets/36957919/663a8525-ed57-42b0-9be4-a876d3206abe)



