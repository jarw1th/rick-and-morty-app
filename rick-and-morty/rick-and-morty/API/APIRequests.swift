//
//  APIRequests.swift
//  rick-and-morty
//
//  Created by Руслан Парастаев on 20.03.2024.
//

import Foundation

final class APIRequests {
    
    // Function to request characters from the API
    func requestCharacters(_ completion: @escaping (([Character]) -> Void)) {
        guard let url = URL(string: APIConstants.characterUrl) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // Set the HTTP method to GET
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Handle potential errors
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            // Ensure we have data
            guard let data = data else { return }
            
            do {
                // Deserialize the JSON data
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let resultsArray = json?["results"] as? [[String: Any]] {
                    
                    // Convert the results array back to Data for decoding
                    let charactersData = try JSONSerialization.data(withJSONObject: resultsArray)
                    let charactersDecode = try JSONDecoder().decode([CharacterDecode].self, from: charactersData)
                    
                    var characters: [Character] = []
                    
                    // Iterate through the decoded characters
                    for characterDecode in charactersDecode {
                        // Fetch the character image data
                        guard let imageUrl = URL(string: characterDecode.image) else { continue }
                        // Fetch image data safely
                        let imageData: Data
                        do {
                            imageData = try Data(contentsOf: imageUrl)
                        } catch {
                            print("Error fetching image data: \(error)")
                            imageData = Data() // Fallback to empty data
                        }
                        // Create a Character instance and add it to the array
                        let character = Character(from: characterDecode, image: imageData)
                        characters.append(character)
                    }
                    
                    // Call the completion handler on the main thread
                    DispatchQueue.main.async {
                        completion(characters)
                    }
                }
            } catch let decodingError {
                print("Error decoding JSON: \(decodingError)")
            }
        }.resume() // Start the network request
    }
    
}
