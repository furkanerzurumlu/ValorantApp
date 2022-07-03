//
//  ViewController.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 23.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    let statusName = ["Agents","Weapons","Maps"]
    let imageName = ["character","weapons","map" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.register(CustomCell
            .nibName, forCellReuseIdentifier: CustomCell.identifier)
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.separatorStyle = .none
    }
    
    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        let labelName = statusName[indexPath.row]
        let labelImage = imageName[indexPath.row]
        cell.statusNameLabel.text = labelName
        cell.statusImageView.image = UIImage(named: labelImage)
        cell.imageView?.backgroundColor = UIColor(red: 214, green: 70, blue: 76, alpha: 1)
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let fetchData = statusName[indexPath.row]
        if indexPath.row == 0 {
            Router.shared.showCharacterVC(navigationController: self.navigationController)
        }
        else if indexPath.row == 1 {
            Router.shared.showWeaponsVC(navigationController: self.navigationController)
        }
        else {
            Router.shared.showMapsVC(navigationController: self.navigationController)
        }
    }
    
}


