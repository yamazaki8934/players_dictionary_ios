//
//  PlayersViewController.swift
//  players_dictionary_ios
//
//  Created by 山崎浩毅 on 2019/04/27.
//  Copyright © 2019年 山崎浩毅. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    private var tableView: UITableView!
    
    fileprivate var players: [Player] = []
    
    var apiCall: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "選手一覧"
        
        tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(PlayersTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(PlayersTableViewCell.self))
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
    
    var  controllerTag = 0 {
        didSet {
            if controllerTag == 0 {
                Team.fetchGiants(completion: { (players) in
                    self.players = players
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
            } else if controllerTag == 1 {
                Team.fetchSwallows(completion: { (players) in
                    self.players = players
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
            } else if controllerTag == 2 {
                Team.fetchBaystars(completion: { (players) in
                    self.players = players
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
            } else if controllerTag == 3 {
                Team.fetchDragons(completion: { (players) in
                    self.players = players
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
            } else if controllerTag == 4 {
                Team.fetchTigers(completion: { (players) in
                    self.players = players
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
            } else {
                Team.fetchCarp(completion: { (players) in
                    self.players = players
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
            }
        }
    }

}

extension PlayersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PlayersTableViewCell.self), for: indexPath) as! PlayersTableViewCell
        let player = players[indexPath.row]
        cell.leftTitle.text = player.name
        return cell
    }
}
