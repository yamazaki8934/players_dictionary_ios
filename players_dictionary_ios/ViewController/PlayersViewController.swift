//
//  PlayersViewController.swift
//  players_dictionary_ios
//
//  Created by 山崎浩毅 on 2019/04/27.
//  Copyright © 2019年 山崎浩毅. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    private var tableView = UITableView()
    
    fileprivate var players: [Player] = []
    
    var apiCall: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "選手一覧"
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(PlayersTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(PlayersTableViewCell.self))
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

extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PlayersTableViewCell.cellHeight()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(PlayersTableViewCell.self), for: indexPath) as! PlayersTableViewCell
        let player = players[indexPath.row]
        cell.leftTitle.text = player.name
        print(player)
        print(player.name)
        return cell
    }
}

extension PlayersViewController: HomeViewControllerDelegate {
    func selectedTeam(_ teamNumber: Int) {
        if teamNumber == 0 {
            Team.fetchGiants(completion: { (players) in
                self.players = players
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        } else if teamNumber == 1 {
            Team.fetchSwallows(completion: { (players) in
                self.players = players
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        } else if teamNumber == 2 {
            Team.fetchBaystars(completion: { (players) in
                self.players = players
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        } else if teamNumber == 3 {
            Team.fetchDragons(completion: { (players) in
                self.players = players
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        } else if teamNumber == 4 {
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
