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
    
    func showCharacteVC(navigationController: UINavigationController?){
        let characterVC = CharacterVC.instantiate(storyboard: .character)
        navigationController?.pushViewController(characterVC, animated: true)
    }
    
    
}
