//
//  weaponsNetworking.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 8.07.2022.
//

import Foundation
import Alamofire

class weaponsNetworking {
    static let upComingWeapons = "https://valorant-api.com/v1/weapons"
    
    func getUpComingWeapons(completion: @escaping (Weapons?)->()){
        let request = AF.request("https://valorant-api.com/v1/weapons")
        request.validate().responseDecodable(of: Weapons.self) {[weak self] (response) in
            guard let weapons = response.value else{
                completion(nil)
                print(response.error)
                return
            }
            completion(weapons)
        }
    }
}
