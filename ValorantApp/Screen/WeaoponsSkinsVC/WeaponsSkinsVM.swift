//
//  WeaponsSkinsVM.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 17.07.2022.
//

import Foundation

protocol WeaponsSkinsVMProtocol: AnyObject{
    
}

protocol WeaponsSkinsVMDelegate: WeaponsSkinsVMProtocol{
    var delegate: WeaponsSkinsVMDelegateOutputs? {get set}
    var data: [DAtum] {get set}
    func getUpcomingData()
}

protocol WeaponsSkinsVMDelegateOutputs: AnyObject{
    func reloadCollectionView()
}

class WeaponsSkinsVM: WeaponsSkinsVMDelegate {
    
    var delegate: WeaponsSkinsVMDelegateOutputs?
    var data: [DAtum] = []
    var network: weaponsSkinsNetworking = weaponsSkinsNetworking()
    
    
    func getUpcomingData() {
        network.getUpComingWeaponsSkins{[weak self] (response) in
            if let response = response {
                self?.data = response.data
                self?.delegate?.reloadCollectionView()
            }
            
        }
    }
    
    
    
}
