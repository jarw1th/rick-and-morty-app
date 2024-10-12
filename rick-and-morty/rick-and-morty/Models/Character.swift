//
//  CharacterModels.swift
//  rick-and-morty
//
//  Created by Руслан Парастаев on 20.03.2024.
//

import Foundation

// Struct for decoding character data from JSON, conforming to Decodable
struct CharacterDecode: Decodable {
    
    let id: Int          // Unique identifier for the character
    let name: String     // Name of the character
    let image: String    // URL string for the character's image
    let gender: String    // Gender of the character
    let species: String   // Species of the character
    let status: String    // Status of the character (e.g., alive, dead)
    let origin: Origin    // Origin of the character, represented as an Origin struct
    let location: Location // Current location of the character, represented as a Location struct
    
}

// Struct representing a character with data to be used in the app
struct Character {
    
    let id: Int          // Unique identifier for the character
    let name: String     // Name of the character
    let image: Data      // Image data for the character (fetched from the URL)
    let gender: String    // Gender of the character
    let species: String   // Species of the character
    let status: String    // Status of the character (e.g., alive, dead)
    let origin: Origin    // Origin of the character, represented as an Origin struct
    let location: Location // Current location of the character, represented as a Location struct
    
    // Initializer for creating a Character instance with all properties
    init(id: Int, name: String, image: Data, gender: String, species: String, status: String, origin: Origin, location: Location) {
        self.id = id
        self.name = name
        self.image = image
        self.gender = gender
        self.species = species
        self.status = status
        self.origin = origin
        self.location = location
    }
    
    // Initializer for creating a Character instance from a decoded CharacterDecode object and image data
    init(from decode: CharacterDecode, image: Data) {
        self.id = decode.id
        self.name = decode.name
        self.image = image
        self.gender = decode.gender
        self.species = decode.species
        self.status = decode.status
        self.origin = decode.origin
        self.location = decode.location
    }
    
}
