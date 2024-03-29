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
        let weaponsVM = WeaponsVM()
        weaponsVC.viewModel = weaponsVM
        navigationController?.pushViewController(weaponsVC, animated: true)
    }
    
    func showWeaponsSkinsVC(navigationController: UINavigationController?){
        let weaponsSkinsVC = WeaponsSkinsVC.instantiate(storyboard: .weaponsSkins)
        let weaponsSkinsVM = WeaponsSkinsVM()
        weaponsSkinsVC.viewModel = weaponsSkinsVM
        
        navigationController?.pushViewController(weaponsSkinsVC, animated: true)
    }
    
    func showMapsVC(navigationController: UINavigationController?){
        let mapsVC = MapsVC.instantiate(storyboard: .maps)
        let mapsVM = MapsVM()
        mapsVC.viewModel = mapsVM
        navigationController?.pushViewController(mapsVC, animated: true)
    }
    
    func showCharacterDetailVC(navigationController: UINavigationController?, data: Datum){
        let detailVC = CharacterDetailVC.instantiate(storyboard: .characterDetail)
        let characterDetailVM = CharacterDetailVM()
        detailVC.data = data
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func showDeveloperPageVC(navigationController: UINavigationController?){
        let developerVC = Developer.instantiate(storyboard: .developer)
        navigationController?.pushViewController(developerVC, animated: true)
    }
}
