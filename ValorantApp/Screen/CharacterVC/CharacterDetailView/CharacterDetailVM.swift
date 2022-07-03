//
//  CharacterDetailVM.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 3.07.2022.
//

import Foundation

protocol CharacterDetailVMProtocol: AnyObject{
    
}

protocol CharacterDetailVMDelegate: CharacterDetailVMProtocol{
    var data: [Datum] {get set}
    func getUpcomingData()
    
}

class CharacterDetailVM: CharacterVMDelegate{
    var delegate: CharacterVMDelegateOutputs?
    
    var data: [Datum] = []
    var network: charecterNetworking = charecterNetworking()
    
    func getUpcomingData() {
        network.getUpComingCharacter{[weak self] (response) in
            if let response = response {
                self?.data = response.data
            }
            
        }
    }
}

