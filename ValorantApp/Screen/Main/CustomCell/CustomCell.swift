//
//  CustomCell.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 23.06.2022.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var statusNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension CustomCell {
    static var identifier: String {
        return String(describing: Self.self)
    }
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
