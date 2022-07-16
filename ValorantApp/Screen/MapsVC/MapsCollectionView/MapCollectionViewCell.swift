//
//  MapCollectionViewCell.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 13.07.2022.
//

import UIKit

class MapCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mapNameLabel: UILabel!
    @IBOutlet weak var mapIcon: UIImageView!
    @IBOutlet weak var mapIconName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(data: Datums) {
        mapNameLabel.text = data.displayName
        mapIcon.downloaded(from: data.displayIcon ?? "", contentMode: .scaleAspectFit)
    }

}

extension MapCollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier , bundle: nil)
    }
}
