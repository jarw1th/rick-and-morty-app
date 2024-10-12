//
//  DetailCharacterViewModel.swift
//  rick-and-morty
//
//  Created by Руслан Парастаев on 20.03.2024.
//

import Foundation

// Protocol defining the properties that the DetailCharacterViewModel must implement.
protocol DetailCharacterViewModelProtocol {
    
    var name: String { get }          // Character's name
    var image: Data { get }           // Character's image data
    var gender: String { get }        // Character's gender
    var species: String { get }       // Character's species
    var status: String { get }        // Character's status
    var origin: String { get }        // Character's origin
    var location: String { get }      // Character's location
    
}

// Final class implementing the DetailCharacterViewModelProtocol to provide data for a character's details.
final class DetailCharacterViewModel: DetailCharacterViewModelProtocol {
    
    private var character: Character // Private property to hold the character data
    
    // Initializer to create an instance with a specific Character.
    init(character: Character) {
        self.character = character
    }
    
    // Computed property to return the character's name.
    var name: String {
        return character.name // Accessing the name from the character
    }
    
    // Computed property to return the character's image data.
    var image: Data {
        return character.image // Accessing the image data from the character
    }
    
    // Computed property to return the character's gender formatted as a string.
    var gender: String {
        return "Gender: " + character.gender // Concatenating "Gender: " with the character's gender
    }
    
    // Computed property to return the character's species formatted as a string.
    var species: String {
        return "Species: " + character.species // Concatenating "Species: " with the character's species
    }
    
    // Computed property to return the character's status formatted as a string.
    var status: String {
        return "Status: " + character.status // Concatenating "Status: " with the character's status
    }
    
    // Computed property to return the character's origin formatted as a string.
    var origin: String {
        return "Origin: " + character.origin.name // Concatenating "Origin: " with the name of the character's origin
    }
    
    // Computed property to return the character's location formatted as a string.
    var location: String {
        return "Location: " + character.location.name // Concatenating "Location: " with the name of the character's location
    }
    
}
