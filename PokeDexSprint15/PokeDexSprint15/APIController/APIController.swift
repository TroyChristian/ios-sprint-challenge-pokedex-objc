//
//  APIController.swift
//  PokeDexSprint15
//
//  Created by Lambda_School_Loaner_219 on 2/28/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

import Foundation

class APIController:NSObject {
    let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon/")!
    
    @objc  static let shared = APIController() //Singleton because only one instance of APIController should be informing our app.
    
    @objc func retrievePokemon(completion: @escaping ([TLCPokemon]?, Error?) -> Void) {
        var requestURL = URLRequest(url:baseURL)
        requestURL.httpMethod = "GET"
        
        URLSession.shared.dataTask(with:requestURL) { (data, _, error) in
            
            if let error = error {
                print("Error retreiving your pokemons!: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, errorWithMessage("Data is unparsable, incomplete or bad", LSIDataNilError.rawValue))
                return
            }
            
            do {
                if let APIController = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    if let pokemonResults = APIController["results"] as? Array<[String:Any]> {
                        var returnedPokemon = [TLCPokemon]()
                        for pokemonDictionary in pokemonResults {
                            let pokemon = TLCPokemon(dictionary:pokemonDictionary)
                            returnedPokemon.append(pokemon)
                        }
                        completion(returnedPokemon, nil);
                    }
                }
                
            } catch {
                completion(nil, errorWithMessage("Failed to decode pokemon from the JSON", LSIJSONDecodeError.rawValue))
            }
            
            
            
            
        }.resume()
}
    @objc func retrieveDetails(for pokemon: TLCPokemon) {
        var requestURL = URLRequest(url: pokemon.detailsURL)
        requestURL.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            
            if let error = error {
                print("Error retreiving details: \(error)")
                return
            }
            
            guard let data = data else {
                errorWithMessage("Data is unparsable, incomplete or bad", LSIDataNilError.rawValue)
                return
            }
            
            do {
                if let pokemonDetails = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    pokemon.pokemonDetails(with:pokemonDetails)
                }
            } catch {
                errorWithMessage("Decoding JSON Failed", LSIJSONDecodeError.rawValue)
            }
        }.resume()
    
    
}
}
