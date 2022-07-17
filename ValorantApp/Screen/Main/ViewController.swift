//
//  ViewController.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 23.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    let statusName = ["Agents","Weapons","Weapons Skins","Maps"]
    let imageName = ["icon1","icon1","icon1","icon1" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.register(CustomCell
            .nibName, forCellReuseIdentifier: CustomCell.identifier)
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.separatorStyle = .none
        
       
        //navigationController?.navigationBar.topItem?.title = "VALORANT"
        //navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 40)!]
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.bookmarks , target: self, action: #selector(developerAbout))
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    @objc func developerAbout(){
        Router.shared.showDeveloperPageVC(navigationController: self.navigationController)
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
        
        if indexPath.row == 0 {
            Router.shared.showCharacterVC(navigationController: self.navigationController)
        }
        else if indexPath.row == 1 {
            Router.shared.showWeaponsVC(navigationController: self.navigationController)
        }
        else if indexPath.row == 2{
            Router.shared.showWeaponsSkinsVC(navigationController: self.navigationController)
        }
        else {
            Router.shared.showMapsVC(navigationController: self.navigationController)
        }
    }
    
}


