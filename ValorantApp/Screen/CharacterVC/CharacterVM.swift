//
//  CharacterVM.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 23.06.2022.
//

import Foundation

protocol CharacterVMProtocol: AnyObject{
    
}

protocol CharacterVMDelegate: CharacterVMProtocol{
    func getUpcomingData()
}

protocol CharacterVMDelegateOutputs: AnyObject{
    
}

enum CharacterVMOutputs {
    //case succes()
    case error(String)
}

class CharacterVM: CharacterVMDelegate {
    
    var delegate: CharacterVMDelegateOutputs?
    var network: charecterNetworking = charecterNetworking()
    
    func getUpcomingData() {
        network.getUpComingCharacter{ [weak self] (response) in
            guard let response = response, let self = self else {
                return
            }
        }
    }
}
