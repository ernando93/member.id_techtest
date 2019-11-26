//
//  MenuViewController.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 22/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var menu = DataMenu
    @IBOutlet weak var tableView: UITableView!
    
    var selected: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setViewContent()
    }
}

//MARK: - Setup View Content
extension MenuViewController: UIGestureRecognizerDelegate {
    
    func setViewContent() {
        
        showAnimate()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.45)
        setTableView(in: tableView)
        
    }
    
    func showAnimate() {
        
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
        });
    }
    
    func removeAnimate() {
        
        UIView.animate(withDuration: 0.25, animations: {
            
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
            
        }, completion:{(finished : Bool)  in
            if (finished) {
                
                self.view.removeFromSuperview()
            }
        });
    }
    
    func setTableView(in tableView: UITableView) {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "menuCell")
        tableView.tableFooterView = UIView()
    }
}

//MARK: - TableView Delegate & DataSource
extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.separatorStyle = .none
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as? MenuCell
        
        let data = menu[indexPath.row]
        cell?.setConfigure(with: data, selectedRow: selected)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        case 0:
            removeAnimate()
        case 1:
            
            self.present(UIAlertController.defaultAlertController(title: "", message: "Feature is under development", textAction: "OK"), animated: true, completion: nil)
        case 2:
        
            self.present(UIAlertController.defaultAlertController(title: "", message: "Feature is under development", textAction: "OK"), animated: true, completion: nil)
        case 3:
            
            User.logout()
            
            let scene = UIApplication.shared.connectedScenes.first
            if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                
                sd.showLoginPage()
            }
        default:
            
            print("Default")
        }
    }
}

//MARK: - Action
extension MenuViewController {
    
    @objc func viewTapped() {
        
        removeAnimate()
    }
}
