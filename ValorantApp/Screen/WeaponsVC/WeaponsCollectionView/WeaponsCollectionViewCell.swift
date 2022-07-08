//
//  WeaponsCollectionViewCell.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 8.07.2022.
//

import UIKit

class WeaponsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var weaponsCellView: UIView!
    @IBOutlet weak var weaponsImageView: UIImageView!
    @IBOutlet weak var weaponsNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        weaponsCellView.layer.cornerRadius = 10
        weaponsCellView.clipsToBounds = true
        weaponsCellView.layer.borderWidth = 3
        weaponsCellView.layer.borderColor = UIColor.black.cgColor
    }

}
