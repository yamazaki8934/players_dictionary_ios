//
//  HomeViewController.swift
//  players_dictionary_ios
//
//  Created by 山崎浩毅 on 2019/04/27.
//  Copyright © 2019年 山崎浩毅. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func selectedTeam(_ teamNumber: Int)
}

class HomeViewController: UIViewController {

    fileprivate enum RowType: String, CaseIterable {
        case giants = "巨人"
        case swallows = "ヤクルト"
        case baystars = "DeNA"
        case dragons = "中日"
        case tigers = "阪神"
        case carp = "広島"
    }
    
    private var tableView: UITableView!
    
    weak var delegate: HomeViewControllerDelegate?
    
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
            self.delegate?.selectedTeam(0)
            self.navigationController?.pushViewController(controller, animated: true)
        case .swallows:
            let controller = PlayersViewController()
            self.delegate?.selectedTeam(1)
            self.navigationController?.pushViewController(controller, animated: true)
        case .baystars:
            let controller = PlayersViewController()
            self.delegate?.selectedTeam(2)
            self.navigationController?.pushViewController(controller, animated: true)
        case .dragons:
            let controller = PlayersViewController()
            self.delegate?.selectedTeam(3)
            self.navigationController?.pushViewController(controller, animated: true)
        case .tigers:
            let controller = PlayersViewController()
            self.delegate?.selectedTeam(4)
            self.navigationController?.pushViewController(controller, animated: true)
        case .carp:
            let controller = PlayersViewController()
            self.delegate?.selectedTeam(5)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HomeTableViewCell.self), for: indexPath) as! HomeTableViewCell
        cell.leftTitle.text = RowType.allCases[indexPath.row].rawValue
        return cell
    }
}
