//
//  CharacterDetailVC.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 3.07.2022.
//

import UIKit
import SwiftUI

class CharacterDetailVC: UIViewController {
    
    @IBOutlet weak var characterDetailImageView: UIImageView!
    @IBOutlet weak var characterDisplayName: UILabel!
    @IBOutlet weak var characterDescription: UILabel!
    @IBOutlet weak var characterRole: UILabel!
    @IBOutlet weak var characterRoleDescription: UILabel!
    
    //Abilities Slot1
    
    @IBOutlet weak var abilitiesDisplayIcon: UIImageView!
    @IBOutlet weak var abilitiesSlot: UILabel!
    @IBOutlet weak var abilitiesDisplayName: UILabel!
    @IBOutlet weak var abilitiesDiscription: UILabel!
    
    //Abilities Slot2
    
    @IBOutlet weak var abilitiesDisplayIcon2: UIImageView!
    @IBOutlet weak var abilitiesSlot2: UILabel!
    @IBOutlet weak var abilitiesDisplayName2: UILabel!
    @IBOutlet weak var abilitiesDiscription2: UILabel!
    
    
    var viewModel: CharacterDetailVM?
    
    var data: Datum?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        characterDetailImageView.downloadedImage(from: data?.fullPortraitV2 ?? "")
        characterDisplayName.text = data?.displayName
        characterDescription.text = data?.datumDescription
        characterRole.text = data?.role?.displayName.rawValue
        characterRoleDescription.text = data?.role?.roleDescription
        
        //Abilities Slot Setup
        abilitiesDisplayIcon.downloadedImage(from: data?.abilities[0].displayIcon ?? "")
        abilitiesSlot.text = data?.abilities[0].slot.rawValue
        abilitiesDisplayName.text = data?.abilities[0].displayName
        abilitiesDiscription.text = data?.abilities[0].abilityDescription
        
        //Abilities Slot Setup2
        abilitiesDisplayIcon2.downloadedImage(from: data?.abilities[1].displayIcon ?? "")
        abilitiesSlot.text = data?.abilities[1].slot.rawValue
        abilitiesDisplayName2.text = data?.abilities[1].displayName
        abilitiesDiscription2.text = data?.abilities[1].abilityDescription
        
    }
}

extension UIImageView {
    func downloadedImage(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloadedImage(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
