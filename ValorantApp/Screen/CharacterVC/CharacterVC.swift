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
        
        cell.characterNameLabel.text = viewModel?.data[indexPath.row].displayName
        
        cell.characterImageView.image = UIImage(systemName: "\(viewModel?.data[indexPath.row].displayIcon ?? "")")
        cell.characterImageView.downloaded(from: viewModel?.data[indexPath.row].displayIcon ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = viewModel?.data[indexPath.row] {
            Router.shared.showCharacterDetailVC(navigationController: self.navigationController, data:data)
        }
        
    }
    
}

extension CharacterVC: CharacterVMDelegateOutputs {
    func reloadCollectionView() {
        self.characterCollectionView.reloadData()
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
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
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


