//
//  VeaponseVC.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 23.06.2022.
//

import UIKit

class WeaponsVC: UIViewController {

    @IBOutlet weak var weaponsCollectionView: UICollectionView!
    
    var viewModel: WeaponsVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.delegate = self
        viewModel?.getUpcomingData()
        
        weaponsCollectionView.delegate = self
        weaponsCollectionView.dataSource = self
        
        
        let nibCell = UINib(nibName: "WeaponsCollectionViewCell", bundle: nil)
        weaponsCollectionView.register(nibCell, forCellWithReuseIdentifier: "weaponsCell")
        
    }
    

    

}

extension WeaponsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = weaponsCollectionView.dequeueReusableCell(withReuseIdentifier: "weaponsCell", for: indexPath) as! WeaponsCollectionViewCell
        cell.weaponsNameLabel.text = viewModel?.data[indexPath.row].displayName
        
        cell.weaponsImageView.downloaded(from: viewModel?.data[indexPath.row].displayIcon ?? "")
        
        return cell
    }
}

extension WeaponsVC: WeaponsVMDelegateOutputs{
    func reloadCollectionView() {
        self.weaponsCollectionView.reloadData()
    }
}
