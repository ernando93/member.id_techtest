//
//  FilterViewController.swift
//  TechnicalTest
//
//  Created by Ernando Kasaluhe on 25/11/19.
//  Copyright © 2019 Test Coding. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    var type = DataAwardsType
    var selectedCell = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonFilter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setViewContent()
    }
}

//MARK: - Setup View Content
extension FilterViewController {
    
    func setViewContent() {
        
        setTableView(in: tableView)
        buttonFilter.layer.cornerRadius = 5.0
    }
    
    func setTableView(in tableView: UITableView) {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "PointCell", bundle: nil), forCellReuseIdentifier: "pointCell")
        tableView.register(UINib(nibName: "TypeCell", bundle: nil), forCellReuseIdentifier: "typeCell")
        
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        
    }
}

//MARK: - Setup TableView Delegate and DataSource
extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
            
        case 0:
            
            return 0.0
        case 1:
            
            return 0.0
        case 2:
            
            return 33.0
        default:
            
            return 0.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewSection = UIView()
        viewSection.backgroundColor = .clear
        
        let label = UILabel()
        label.text = "Awards Type"
        label.textAlignment = .left
        label.sizeToFit()
        label.frame = CGRect(x: 25.0, y: 0.0, width: 250.0, height: 20.0)
        label.font = UIFont(name: "AvenirNext-Medium", size: 17.0)
        label.textColor = .black
        viewSection.addSubview(label)
        
        return viewSection
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            
        case 0:
            
            return 1
        case 1:
            
            return 1
        case 2:
            
            return type.count
        default:
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
            
        case 0:
            
            return 100.0
        case 1:
            
            return 100.0
        case 2:
            
            return 50.0
        default:
            
            return 0.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "pointCell", for: indexPath) as? PointCell
            
            return cell ?? UITableViewCell()
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "pointCell", for: indexPath) as? PointCell
            
            return cell ?? UITableViewCell()
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "typeCell", for: indexPath) as? TypeCell
            
            let data = type[indexPath.row]
            let isCellSelected = selectedCell.contains(data.name ?? "")
            
            cell?.setConfigure(with: data, selected: isCellSelected)
            
            return cell ?? UITableViewCell()
        default:
            
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
            
        case 0:
            
            print("Point")
        case 1:
            
            print("Point")
        case 2:
            
            let name = type[indexPath.row].name
            
            if selectedCell.contains(name ?? "") {
                let removeIndex = selectedCell.firstIndex(of: name ?? "")
                selectedCell.remove(at: removeIndex!)
            } else {
                selectedCell.append(name ?? "")
            }
            
            tableView.reloadData()
        default:
            
            print("Default")
        }
    }
    
    
    
}

//MARK: - Action
extension FilterViewController {
    
    @IBAction func buttonCancelTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
