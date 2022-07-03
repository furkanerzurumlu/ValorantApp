//
//  Router.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 23.06.2022.
//

import Foundation
import UIKit

final class Router {
    
    static var shared: Router = Router()
    
    func showCharacterVC(navigationController: UINavigationController?){
        let characterVC = CharacterVC.instantiate(storyboard: .character)
        let characterVM = CharacterVM()
        characterVC.viewModel = characterVM
        navigationController?.pushViewController(characterVC, animated: true)
    }
    
    func showWeaponsVC(navigationController: UINavigationController?){
        let weaponsVC = WeaponsVC.instantiate(storyboard: .weapons)
        navigationController?.pushViewController(weaponsVC, animated: true)
    }
    
    func showMapsVC(navigationController: UINavigationController?){
        let mapsVC = MapsVC.instantiate(storyboard: .maps)
        navigationController?.pushViewController(mapsVC, animated: true)
    }
    
}
