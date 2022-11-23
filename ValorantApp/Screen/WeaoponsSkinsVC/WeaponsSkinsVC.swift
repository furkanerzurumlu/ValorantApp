//
//  WeaponsSkinsVC.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 17.07.2022.
//

import UIKit

class WeaponsSkinsVC: UIViewController {

    @IBOutlet weak var weaponsSkinsCollectionView: UICollectionView!
    
    var viewModel: WeaponsSkinsVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.delegate = self
        viewModel?.getUpcomingData()
        
        
        weaponsSkinsCollectionView.register(WeaponsSkinsCollectionViewCell.nibName, forCellWithReuseIdentifier: WeaponsSkinsCollectionViewCell.identifier)
        weaponsSkinsCollectionView.delegate = self
        weaponsSkinsCollectionView.dataSource = self
    }


}

extension WeaponsSkinsVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height = view.layer.frame.height - 100
        var width = view.layer.frame.width - 100
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = weaponsSkinsCollectionView.dequeueReusableCell(withReuseIdentifier: WeaponsSkinsCollectionViewCell.identifier, for: indexPath) as! WeaponsSkinsCollectionViewCell
        return cell
    }
    
    
}
    

extension WeaponsSkinsVC: WeaponsSkinsVMDelegateOutputs{
    func reloadCollectionView() {
        self.weaponsSkinsCollectionView.reloadData()
    }
}
