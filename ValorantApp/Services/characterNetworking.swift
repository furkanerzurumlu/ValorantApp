//
//  characterNetworking.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 24.06.2022.
//

import Foundation
import Alamofire

class charecterNetworking{
    
    static let upComingCharacter = "https://valorant-api.com/v1/agents"
    
    func getUpComingCharacter(completion: @escaping (Character?)->()){
        let request = AF.request("https://valorant-api.com/v1/agents")
        request.validate().responseDecodable(of: Character.self) {[weak self] (response) in
            guard let character = response.value else{
                completion(nil)
                print(response.error)
                return
            }
            completion(character)
        }
    }
    
    
    
}
