//
//  CharacterCollectionViewCell.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 27.06.2022.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.layer.cornerRadius = 16
        stackView.clipsToBounds = true
    }

}
