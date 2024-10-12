# Rick and Morty Character Viewer

This iOS application allows users to explore characters from the popular animated series *Rick and Morty*. It fetches character data from the Rick and Morty API and presents it in a user-friendly interface.

## Features

- Display a list of characters with their names and genders.
- Show detailed information about each character, including:
  - Name
  - Image
  - Gender
  - Species
  - Status
  - Origin
  - Location
- Fetch character data from the [Rick and Morty API](https://rickandmortyapi.com/documentation).

## Technologies Used

- Swift
- UIKit
- MVVM architecture
- URLSession for API requests

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/rick-and-morty.git
2. Open the project in Xcode:

 - Navigate to the project directory and open rick-and-morty.xcodeproj.
3. Run the project:
- Select a simulator or connect a device, then click the Run button in Xcode.

## Usage
- Launch the app, and you'll see a list of characters.
- Tap on any character to view detailed information.
- The app fetches data from the Rick and Morty API, ensuring up-to-date character information.

## Architecture
This project follows the MVVM (Model-View-ViewModel) architecture to separate concerns and improve maintainability:

- Model: Represents the data structures (e.g., Character, Origin, Location).
- View: User interface components (e.g., CharactersListViewController, DetailCharacterViewController).
- ViewModel: Provides the data and logic for the views (e.g., CharactersListViewModel, DetailCharacterViewModel).
## Contributing
If you want to contribute to this project, feel free to fork the repository and submit a pull request. Please ensure your code follows the project's coding standards.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Contact
For inquiries, please contact:

- Name: Руслан Парастаев
- Email: [parastaev31@gmail.com]
