//
//  HomeViewController.swift
//  players_dictionary_ios
//
//  Created by 山崎浩毅 on 2019/04/27.
//  Copyright © 2019年 山崎浩毅. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    fileprivate enum RowType: CaseIterable {
        case giants,
             swallows,
             baystars,
             dragons,
             tigers,
             carp
    }
    
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "チーム名を選択"
        
        tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(HomeTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: UIScreen.main.bounds.width,
                                 height: UIScreen.main.bounds.height)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RowType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HomeTableViewCell.cellHeight()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch RowType.allCases[indexPath.row] {
        case .giants:
            let controller = PlayersViewController()
            controller.controllerTag = 0
            let navi = UINavigationController(rootViewController: controller)
            present(navi, animated: true, completion: nil)
        case .swallows:
            let controller = PlayersViewController()
            controller.controllerTag = 1
            let navi = UINavigationController(rootViewController: controller)
            present(navi, animated: true, completion: nil)
        case .baystars:
            let controller = PlayersViewController()
            controller.controllerTag = 2
            let navi = UINavigationController(rootViewController: controller)
            present(navi, animated: true, completion: nil)
        case .dragons:
            let controller = PlayersViewController()
            controller.controllerTag = 3
            let navi = UINavigationController(rootViewController: controller)
            present(navi, animated: true, completion: nil)
        case .tigers:
            let controller = PlayersViewController()
            controller.controllerTag = 4
            let navi = UINavigationController(rootViewController: controller)
            present(navi, animated: true, completion: nil)
        case .carp:
            let controller = PlayersViewController()
            controller.controllerTag = 5
            let navi = UINavigationController(rootViewController: controller)
            present(navi, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HomeTableViewCell.self), for: indexPath) as! HomeTableViewCell
        switch RowType.allCases[indexPath.row] {
        case .giants:
            cell.leftTitle.text = "巨人"
        case .swallows:
            cell.leftTitle.text = "ヤクルト"
        case .baystars:
            cell.leftTitle.text = "DeNA"
        case .dragons:
            cell.leftTitle.text = "中日"
        case .tigers:
            cell.leftTitle.text = "阪神"
        case .carp:
            cell.leftTitle.text = "広島"
        }
        return cell
    }
}
