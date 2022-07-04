//
//  CharacterDetailVC.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 3.07.2022.
//

import UIKit

class CharacterDetailVC: UIViewController {
    
    @IBOutlet weak var characterDetailImageView: UIImageView!
    @IBOutlet weak var characterDisplayName: UILabel!
    @IBOutlet weak var characterDescription: UILabel!
    @IBOutlet weak var characterRole: UILabel!
    @IBOutlet weak var characterRoleDescription: UILabel!
    
    var viewModel: CharacterDetailVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //characterDisplayName.text = viewModel?.data.
    }
    
   

}

