//
//  CharactersViewModel.swift
//  rick-and-morty
//
//  Created by Руслан Парастаев on 20.03.2024.
//

import Foundation

protocol CharactersListViewModelProtocol {
    var title: String { get }
    
    var numberOfSections: Int { get }
     
    var numberOfRows: Int { get }
    
    func getCharacters(_ completion: @escaping (() -> Void))
    
    func getCharacter(for indexPath: IndexPath, completion: ((Character) -> Void))
}

final class CharactersListViewModel: CharactersListViewModelProtocol {
    private var charactersModel = CharactersModel()
    private let requests = APIRequests()
    
    var title: String {
        return "All characters"
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRows: Int {
        let number = charactersModel.characters.count
        return number
    }
    
    func getCharacters(_ completion: @escaping (() -> Void)) {
        requests.allCharactersRequest(completion: { characters in
            self.charactersModel.characters = characters
            completion()
        })
    }
    
    func getCharacter(for indexPath: IndexPath, completion: ((Character) -> Void)) {
        let character = charactersModel.characters[indexPath.row]
        completion(character)
    }
}
