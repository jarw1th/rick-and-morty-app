//
//  CharactersViewModel.swift
//  rick-and-morty
//
//  Created by Руслан Парастаев on 20.03.2024.
//

import Foundation

// Protocol defining the essential methods and properties for the Characters List ViewModel
protocol CharactersListViewModelProtocol {
    
    var title: String { get }             // Title for the character list
    var numberOfSections: Int { get }      // Number of sections in the list
    var numberOfRows: Int { get }          // Number of rows (characters) in the list
    
    // Method to fetch characters from the API
    func getCharacters(_ completion: @escaping (() -> Void))
    
    // Method to get a specific character for a given index path
    func getCharacter(for indexPath: IndexPath, completion: ((Character) -> Void))
}

// Final class implementing the CharactersListViewModelProtocol
final class CharactersListViewModel: CharactersListViewModelProtocol {
    
    private let api = APIRequests() // Instance of the APIRequests class to handle network requests
    private var characters: [Character] = [] // Array to hold the list of characters
    
    // Title for the character list
    var title: String {
        return "All characters"
    }
    
    // Number of sections in the character list (always 1 for this app)
    var numberOfSections: Int {
        return 1
    }
    
    // Number of rows in the character list, determined by the number of characters fetched
    var numberOfRows: Int {
        let number = characters.count // Get the count of characters
        return number
    }
    
    // Fetches characters from the API and updates the characters array
    func getCharacters(_ completion: @escaping (() -> Void)) {
        api.requestCharacters { characters in // Call the API to get characters
            self.characters = characters // Update the characters array with the fetched data
            completion() // Notify that the fetching is complete
        }
    }
    
    // Returns a character for a specific index path
    func getCharacter(for indexPath: IndexPath, completion: ((Character) -> Void)) {
        let character = characters[indexPath.row] // Get the character at the specified index
        completion(character) // Return the character via the completion handler
    }
    
}
