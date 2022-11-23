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
    var pageIndex: Int = 0
    var cellTextImageIndex:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.delegate = self
        viewModel?.getUpcomingData()
        
        mapCollectionView.register(MapCollectionViewCell.nibName, forCellWithReuseIdentifier: MapCollectionViewCell.identifier)
        mapCollectionView.delegate = self
        mapCollectionView.dataSource = self
        mapsPageController.currentPage = 0
        //mapsPageController.numberOfPages = viewModel?.data.count ?? 0
    }

}



extension MapsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height = view.layer.frame.height
        var width = view.layer.frame.width
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mapCollectionView.dequeueReusableCell(withReuseIdentifier: MapCollectionViewCell.identifier, for: indexPath) as! MapCollectionViewCell
        
        if let data = viewModel?.data[indexPath.row] {
            cell.setData(data: data)

        }
        
        //cell.mapIconName.text = viewModel?.data[indexPath.row].displayName
        return cell
    }
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in mapCollectionView.visibleCells {
          if let row = mapCollectionView.indexPath(for: cell)?.item {
              mapsPageController.currentPage = row
              cellTextImageIndex = row
          }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
}

extension MapsVC: MapsVMDelegateOutputs{
    func reloadCollectionView() {
        mapsPageController.numberOfPages = viewModel?.data.count ?? 0
        self.mapCollectionView.reloadData()
    }
}
