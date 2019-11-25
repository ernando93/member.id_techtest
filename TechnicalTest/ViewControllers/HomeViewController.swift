//
//  HomeViewController.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 21/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var awards = DataAwards
    
    @IBOutlet weak var buttonMenu: UIButton!
    @IBOutlet weak var buttonFilter: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setViewContent()
    }
}

//MARK: - Setup View Content
extension HomeViewController {
    
    func setViewContent() {
        
        buttonMenu.addTarget(self, action: #selector(buttonMenuTapped), for: .touchUpInside)
        buttonFilter.addTarget(self, action: #selector(buttonFilterTapped), for: .touchUpInside)
        setCollectionView(in: collectionView)
    }
    
    func setCollectionView(in collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "AwardsCell", bundle: nil), forCellWithReuseIdentifier: "awardsCell")
    }
}

//MARK: - CollectionView Delegate & DataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return awards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0.0, left: 25.0, bottom: 20.0, right: 25.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width - 50.0, height: 170.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "awardsCell", for: indexPath) as? AwardsCell
        
        let data = awards[indexPath.row]
        cell?.setConfigure(with: data)
        
        return cell ?? UICollectionViewCell()
    }
}

//MARK: - Action
extension HomeViewController {
    
    @objc func buttonMenuTapped() {
        
        let vc = MenuViewController(nibName: "MenuViewController", bundle: nil)
        vc.selected = 0
        self.addChild(vc)
        vc.view.frame = self.view.frame
        self.view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
    @objc func buttonFilterTapped() {
        
        let vc = FilterViewController(nibName: "FilterViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
