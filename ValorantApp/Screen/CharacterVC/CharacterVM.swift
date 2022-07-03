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
    var Data: [Datum] {get set}
    func getUpcomingData()
}

protocol CharacterVMDelegateOutputs: AnyObject{
    func reloadCollectionView()
}



class CharacterVM: CharacterVMDelegate {
    var Data: [Datum] = []
    var delegate: CharacterVMDelegateOutputs?
    var network: charecterNetworking = charecterNetworking()
    
    func getUpcomingData() {
        network.getUpComingCharacter{ [weak self] (response) in
            guard let response = response, let self = self else {
                return
            }
            self.Data = response.data
            self.delegate?.reloadCollectionView()
        }
    }
}
