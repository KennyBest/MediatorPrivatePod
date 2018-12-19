//
//  ViewController.swift
//  MediatorPrivatePod
//
//  Created by Kede on 2018/12/19.
//  Copyright © 2018 Clare. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(tableView)
    }
    
    //MARK: --
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            if let vc = Mediator.communityViewController() {
                navigationController?.pushViewController(vc, animated: true)
            }
//            if let vc = Mediator.shared.getCommunityViewController() {
//                navigationController?.pushViewController(vc, animated: true)
//            }
        case 1:
            if let vc = Mediator.shared.targetViewController(module: "NewPrivatePod", className: "ScoreViewController", params: nil) {
                navigationController?.pushViewController(vc, animated: true)
            }
        default:
            print("can't find index")
        }
    }
    
    lazy var tableView: UITableView = {
        let _tableView = UITableView(frame: self.view.bounds, style: .plain)
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return _tableView
    }()
    
    lazy var dataSource = [
        "Goto CommunityPrivatePod",
        "Goto NewPrivatePod",
    ]
    

}

