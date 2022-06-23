//
//  CustomCell.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 23.06.2022.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var statusNameLabel: UILabel!
    @IBOutlet weak var topView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.topView.layer.cornerRadius = 5
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
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
