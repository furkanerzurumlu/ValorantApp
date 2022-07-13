//
//  MapsVC.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 23.06.2022.
//

import UIKit

class MapsVC: UIViewController {

    @IBOutlet weak var mapCollectionView: UICollectionView!
    
    var viewModel: MapsVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapCollectionView.register(MapCollectionViewCell.nibName, forCellWithReuseIdentifier: MapCollectionViewCell.identifier)
        mapCollectionView.delegate = self
        mapCollectionView.dataSource = self
    }

}



extension MapsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height = view.layer.frame.height
        var width = view.layer.frame.width
        return CGSize(width: CGFloat(width), height: CGFloat(height))
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mapCollectionView.dequeueReusableCell(withReuseIdentifier: MapCollectionViewCell.identifier, for: indexPath) as! MapCollectionViewCell
        cell.backgroundColor = .blue
        return cell
    }
    
    
}
