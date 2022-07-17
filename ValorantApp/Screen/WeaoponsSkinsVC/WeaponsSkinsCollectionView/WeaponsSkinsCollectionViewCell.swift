//
//  WeaponsSkinsCollectionViewCell.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 17.07.2022.
//

import UIKit

class WeaponsSkinsCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}


extension WeaponsSkinsCollectionViewCell{
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
