//
//  APIRequests.swift
//  rick-and-morty
//
//  Created by Руслан Парастаев on 20.03.2024.
//

import Foundation

final class APIRequests {
    func allCharactersRequest(completion: @escaping (([Character]) -> Void)) {
        guard let url = URL(string: URLs.characterUrl) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
                if let error = error {
                    print(error)
                } else if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    var charactersList: [Character] = []
                    let results = json["results"] as? Array<[String: Any]>
                    results?.forEach({ result in
                        let id = (result["id"] as? Int) ?? 0
                        let name = (result["name"] as? String) ?? ""
                        let imageString = (result["image"] as? String) ?? ""
                        let imageUrl = URL(string: imageString)
                        let imageData = (try? Data(contentsOf: imageUrl!)) ?? Data()
                        let gender = (result["gender"] as? String) ?? ""
                        let species = (result["species"] as? String) ?? ""
                        let status = (result["status"] as? String) ?? ""
                        let originData = (result["origin"] as? [String: Any])
                        let origin = (originData?["name"] as? String) ?? ""
                        let locationData = (result["location"] as? [String: Any])
                        let location = (locationData?["name"] as? String) ?? ""
                        let character = Character(id: id,
                                                  name: name,
                                                  image: imageData,
                                                  gender: gender,
                                                  species: species,
                                                  status: status,
                                                  origin: origin,
                                                  location: location)
                        charactersList.append(character)
                    })
                    completion(charactersList)
                }
            }).resume()
        }
    }
}
