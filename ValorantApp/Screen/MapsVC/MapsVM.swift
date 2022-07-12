//
//  MapsVM.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 23.06.2022.
//

import Foundation

protocol MapsVMProtocol: AnyObject{
    
}

protocol MapsVMDelegate: MapsVMProtocol{
    var delegate: MapsVMDelegateOutputs? {get set}
    var data: [Datums] {get set}
    func getUpcomingData()
}

protocol MapsVMDelegateOutputs: AnyObject{
    func reloadCollectionView()
}

class MapsVM: MapsVMDelegate {
    var delegate: MapsVMDelegateOutputs?
    var data: [Datums] = []
    var network: mapsNetworking = mapsNetworking()
    
    func getUpcomingData() {
        network.getUpComingMaps{[weak self] (response) in
            if let response = response {
                self?.data = response.data
                self?.delegate?.reloadCollectionView()
            }
        }
    }
}
