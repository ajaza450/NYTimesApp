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
   git clone https://github.com/yourusername/NYTimesApp.git
   cd NYTimesApp
