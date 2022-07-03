//
//  CharacterVC.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 23.06.2022.
//

import UIKit

class CharacterVC: UIViewController {
    
    
    @IBOutlet weak var characterCollectionView: UICollectionView!
    
    var viewModel: CharacterVM?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        viewModel?.getUpcomingData()
        characterCollectionView.delegate = self
        characterCollectionView.dataSource = self
        
        
        let nibCell = UINib(nibName: "CharacterCollectionViewCell", bundle: nil)
        characterCollectionView.register(nibCell, forCellWithReuseIdentifier: "characterCell")
        
    }
    
}


extension CharacterVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = characterCollectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as! CharacterCollectionViewCell
        cell.characterNameLabel.text = viewModel?.data[indexPath.row].developerName
        return cell
    }
    
}

extension CharacterVC: CharacterVMDelegateOutputs {
    func reloadCollectionView() {
        self.characterCollectionView.reloadData()
    }
}

