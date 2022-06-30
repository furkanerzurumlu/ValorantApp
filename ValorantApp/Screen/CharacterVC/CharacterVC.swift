//
//  CharacterVC.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 23.06.2022.
//

import UIKit

class CharacterVC: UIViewController {
    
    
    @IBOutlet weak var characterCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterCollectionView.delegate = self
        characterCollectionView.dataSource = self
        
        
        let nibCell = UINib(nibName: "CharacterCollectionViewCell", bundle: nil)
        characterCollectionView.register(nibCell, forCellWithReuseIdentifier: "characterCell")
        
    }
    
}


extension CharacterVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = characterCollectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as! CharacterCollectionViewCell
        return cell
    }
    
}


