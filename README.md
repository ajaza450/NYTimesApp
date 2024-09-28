# NYTimesApp
This project demonstrates a SwiftUI app that fetches and displays the most popular articles from the NYTimes API. The project uses modern Swift coding practices such as async/await, SwiftUI with MVVM architecture, and includes unit tests with code coverage.

## Features
- Fetches the most popular articles using the New York Times API.
- Implements **MVVM** architecture (Model-View-ViewModel) to separate UI and business logic.
- Networking with async/await using a generic `NetworkingManager`.
- Unit tests for networking, error handling, and response validation.
- Code coverage report available via Xcode.

## Getting Started

### Prerequisites
- Xcode 14.0+
- Swift 5.5+
- An API key from [NYTimes](https://developer.nytimes.com/apis)

### Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/ajaza450/NYTimesApp.git
   cd NYTimesApp

2. Open the project in Xcode:
 ```bash
open NYTimesApp.xcodeproj

3. Insert your NYTimes API Key:
 . Go to Endpoint.swift and replace the placeholder "YOUR_API_KEY" with your actual API key.
 ```bash
return "/all-sections/7.json?api-key=YOUR_API_KEY"

4. Build and run the app:

. Select the target device or simulator.
. Press Cmd + R to build and run the application.

### Running the Unit Tests

1. Run the tests in Xcode:

. Open the NYTimesApp project in Xcode.
. Press Cmd + U to run all tests.

2. Check code coverage:

. Go to Product > Scheme > Edit Scheme > Test > Options and enable "Gather coverage data."
. After running the tests, view the coverage in the Report Navigator > Coverage tab.








