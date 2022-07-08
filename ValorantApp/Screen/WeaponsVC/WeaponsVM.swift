//
//  VeaponseVM.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 23.06.2022.
//

import Foundation

protocol WeaponsVMProtocol: AnyObject{
    
}

protocol WeaponsVMDelegate: WeaponsVMProtocol{
    var delegate: WeaponsVMDelegateOutputs? {get set}
    var data: [DATUM] {get set}
    func getUpcomingData()
}

protocol WeaponsVMDelegateOutputs: AnyObject{
    func reloadCollectionView()
}

class WeaponsVM: WeaponsVMDelegate {
    
    var delegate: WeaponsVMDelegateOutputs?
    var data: [DATUM] = []
    var network: weaponsNetworking = weaponsNetworking()
    
    func getUpcomingData() {
        network.getUpComingWeapons{[weak self] (response) in
            if let response = response {
                self?.data = response.data
                self?.delegate?.reloadCollectionView()
            }
            
        }
        
    }
}
