//
//  DetailCharacterViewModel.swift
//  rick-and-morty
//
//  Created by Руслан Парастаев on 20.03.2024.
//

import Foundation

protocol DetailCharacterViewModelProtocol {
    func setSelectedCharacter(_ character: Character)
    
    var name: String { get }
    
    var image: Data { get }
    
    var gender: String { get }
    
    var species: String { get }
    
    var status: String { get }
    
    var origin: String { get }
    
    var location: String { get }
}

final class DetailCharacterViewModel: DetailCharacterViewModelProtocol {
    private var characterModel = CharacterModel()
    
    func setSelectedCharacter(_ character: Character) {
        characterModel.character = character
    }
    
    var name: String {
        let name = (characterModel.character?.name ?? "")
        return name
    }
    
    var image: Data {
        let image = characterModel.character?.image ?? Data()
        return image
    }
    
    var gender: String {
        let gender = "Gender: " + (characterModel.character?.gender ?? "")
        return gender
    }
    
    var species: String {
        let species = "Species: " + (characterModel.character?.species ?? "")
        return species
    }
    
    var status: String {
        let status = "Status: " + (characterModel.character?.status ?? "")
        return status
    }
    
    var origin: String {
        let origin = "Origin: " + (characterModel.character?.origin ?? "")
        return origin
    }
    
    var location: String {
        let location = "Location: " + (characterModel.character?.location ?? "")
        return location
    }
}
