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

 - Go to Endpoint.swift and replace the placeholder "YOUR_API_KEY" with your actual API key.

    ```bash
    return "/all-sections/7.json?api-key=YOUR_API_KEY"

4. Build and run the app:

- Select the target device or simulator.
- Press Cmd + R to build and run the application.

### Running the Unit Tests

1. Run the tests in Xcode:

- Open the NYTimesApp project in Xcode.
- Press Cmd + U to run all tests.

2. Check code coverage:

- Go to Product > Scheme > Edit Scheme > Test > Options and enable "Gather coverage data."
- After running the tests, view the coverage in the Report Navigator > Coverage tab.
  
### Architecture

This app uses the MVVM (Model-View-ViewModel) architecture:

- Model: Codable structures for parsing the JSON response from the New York Times API.
- ViewModel: The `MostPopularArticlesViewModel` handles data fetching, error handling, and exposing data to the view.
- View: SwiftUI views display the fetched data and interact with the `ViewModel`.
### File Structure
- `NetworkingManager.swift`: Manages API requests using `URLSession` and async/await.
- `Endpoint.swift`: Defines the API endpoint to fetch most-viewed articles.
- `MostPopularArticlesViewModel.swift`: Handles business logic and data manipulation.
- `ContentView.swift`: The main SwiftUI view that displays the articles.
- `MostPopularArticlesViewModelTests.swift`: Unit tests for the Fetch Articles and API interactions.
- `NetworkingManagerTests.swift`: Unit tests for the NetworkingManager and API interactions.

### Example Usage
    ```bash
    @MainActor
    func fetchArticles() async {
       do {
             let endpoint = Endpoint.mostViewed(section: "all-sections", period: 7)
             let articles = try await networkingManager.request(.shared, endpoint, modelType: Json4Swift_Base.self)
             print(articles.results)
         } catch {
             print("Error fetching articles: \(error)")
         }
      }
     

### Testing
Unit tests are provided to validate the networking layer, including:

- Successful API response test: Verifies that the response is correctly parsed.
- Error handling tests: Ensures that invalid responses and network errors are handled correctly.
To run tests:

    ```bash
    Cmd + U
    
To generate code coverage reports:

- Enable code coverage from Product > Scheme > Edit Scheme > Test > Options.
- Run the tests and check the Coverage tab under the Report Navigator.

### Code Coverage
The project includes unit tests for the networking manager to ensure correct handling of responses and errors. The tests aim to cover all critical functions.

### Pushing Changes
If you make modifications and want to push them to GitHub:
      ```bash
       git add .
      

### License
This project is licensed under the MIT License - see the LICENSE file for details.
### Contact
For any questions or issues, feel free to reach out to your.email@example.com.


