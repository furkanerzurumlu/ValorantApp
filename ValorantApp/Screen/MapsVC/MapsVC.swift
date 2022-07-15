//
//  MapsVC.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 23.06.2022.
//

import UIKit

class MapsVC: UIViewController {

    @IBOutlet weak var mapCollectionView: UICollectionView!
    @IBOutlet weak var mapsPageController: UIPageControl!
    @IBOutlet weak var mapIconName: UILabel!
    
    var viewModel: MapsVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.delegate = self
        viewModel?.getUpcomingData()
        
        mapCollectionView.register(MapCollectionViewCell.nibName, forCellWithReuseIdentifier: MapCollectionViewCell.identifier)
        mapCollectionView.delegate = self
        mapCollectionView.dataSource = self
        
        //mapsPageController.numberOfPages = viewModel?.data.count ?? 0
    }

}



extension MapsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var height = view.layer.frame.height
//        var width = view.layer.frame.width
        return CGSize(width: 414, height: 600)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mapCollectionView.dequeueReusableCell(withReuseIdentifier: MapCollectionViewCell.identifier, for: indexPath) as! MapCollectionViewCell
      //  cell.mapIcon.downloaded(from: viewModel?.data[indexPath.row].displayIcon ?? "")
        cell.mapIcon.downloaded(from: viewModel?.data[indexPath.row].displayIcon ?? "", contentMode: .scaleAspectFit)
        self.mapIconName.text = viewModel?.data[indexPath.row].displayName
        //cell.mapIconName.text = viewModel?.data[indexPath.row].displayName
        return cell
    }
    
    
}

extension MapsVC: MapsVMDelegateOutputs{
    func reloadCollectionView() {
        self.mapCollectionView.reloadData()
    }
}
