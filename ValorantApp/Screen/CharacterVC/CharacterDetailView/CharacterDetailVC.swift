//
//  CharacterDetailVC.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 3.07.2022.
//

import UIKit
import SwiftUI
import Kingfisher

class CharacterDetailVC: UIViewController {
    
    @IBOutlet weak var slotView: UIView!
    @IBOutlet weak var slot1: UIView!
    @IBOutlet weak var slot2: UIView!
    @IBOutlet weak var slot3: UIView!
    @IBOutlet weak var slot4: UIView!
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var abilitiesLabel: UILabel!
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
    
    //Abilities Slot3
    @IBOutlet weak var abilitiesDisplayIcon3: UIImageView!
    @IBOutlet weak var abilitiesSlot3: UILabel!
    @IBOutlet weak var abilitiesDisplayName3: UILabel!
    @IBOutlet weak var abilitiesDiscription3: UILabel!
    
    //Abilities Slot4
    @IBOutlet weak var abilitiesDisplayIcon4: UIImageView!
    @IBOutlet weak var abilitiesSlot4: UILabel!
    @IBOutlet weak var abilitiesDisplayName4: UILabel!
    @IBOutlet weak var abilitiesDiscription4: UILabel!
    
    
    var viewModel: CharacterDetailVM?
    
    var data: Datum?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCorner()
       
        
        
        
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
        abilitiesSlot2.text = data?.abilities[1].slot.rawValue
        abilitiesDisplayName2.text = data?.abilities[1].displayName
        abilitiesDiscription2.text = data?.abilities[1].abilityDescription
        
        //Abilities Slot Setup3
        abilitiesDisplayIcon3.downloadedImage(from: data?.abilities[2].displayIcon ?? "")
        abilitiesSlot3.text = data?.abilities[2].slot.rawValue
        abilitiesDisplayName3.text = data?.abilities[2].displayName
        abilitiesDiscription3.text = data?.abilities[2].abilityDescription
        
        //Abilites Slot Setup4
        abilitiesDisplayIcon4.downloadedImage(from: data?.abilities[3].displayIcon ?? "")
        abilitiesSlot4.text = data?.abilities[3].slot.rawValue
        abilitiesDisplayName4.text = data?.abilities[3].displayName
        abilitiesDiscription4.text = data?.abilities[3].abilityDescription
        
        }
    
    func setCorner(){
        slot1.layer.cornerRadius = 10
        slot2.layer.cornerRadius = 10
        slot3.layer.cornerRadius = 10
        slot4.layer.cornerRadius = 10
        characterImageView.layer.cornerRadius = 30
        
        characterDisplayName.layer.cornerRadius = 10
        characterDisplayName.layer.masksToBounds = true
        
        characterRole.layer.cornerRadius = 10
        characterRole.layer.masksToBounds = true
        
        abilitiesLabel.layer.cornerRadius = 10
        abilitiesLabel.layer.masksToBounds = true
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

