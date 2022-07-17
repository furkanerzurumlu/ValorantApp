//
//  weaponsSkinsNetworking.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 17.07.2022.
//

import Foundation
import Alamofire

class weaponsSkinsNetworking {
    
    static let upComingWeaponsSkins = "https://valorant-api.com/v1/weapons/skins"
    
    func getUpComingWeaponsSkins(completion: @escaping (WeaponsSkins?)->()){
        let request = AF.request("https://valorant-api.com/v1/weapons/skins")
        request.validate().responseDecodable(of: WeaponsSkins.self) {[weak self] (response) in
            guard let weaponsSkins = response.value else{
                completion(nil)
                print(response.error)
                return
            }
            completion(weaponsSkins)
            
        }
    }
}
