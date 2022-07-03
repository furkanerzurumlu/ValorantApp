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
    var delegate: CharacterVMDelegateOutputs? {get set}
    var data: [Datum] {get set}
    func getUpcomingData()
}

protocol CharacterVMDelegateOutputs: AnyObject{
    func reloadCollectionView()
}

class CharacterVM: CharacterVMDelegate {
    
    var data: [Datum] = []
    var delegate: CharacterVMDelegateOutputs?
    var network: charecterNetworking = charecterNetworking()
    
    func getUpcomingData() {
        network.getUpComingCharacter{ [weak self] (response) in
            if let response = response {
                self?.data = response.data
                self?.delegate?.reloadCollectionView()

            }
        }
    }
}
