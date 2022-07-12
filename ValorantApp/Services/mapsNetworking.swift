//
//  mapsNetworking.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 12.07.2022.
//

import Foundation
import Alamofire

class mapsNetworking{
    
    static let upComingMaps = "https://valorant-api.com/v1/maps"
    
    func getUpComingMaps(completion: @escaping (Maps?)->()){
        let request = AF.request("https://valorant-api.com/v1/maps")
        request.validate().responseDecodable(of: Maps.self)  {[weak self] (response) in
            guard let maps = response.value else{
                completion(nil)
                print(response.error)
                return
            }
            completion(maps)
        }
    }
}
