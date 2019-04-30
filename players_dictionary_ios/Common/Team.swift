//
//  Team.swift
//  players_dictionary_ios
//
//  Created by 山崎浩毅 on 2019/04/30.
//  Copyright © 2019年 山崎浩毅. All rights reserved.
//

import UIKit

struct Team {
    static func fetchGiants(completion: @escaping ([Player]) -> Swift.Void) {
        
        let url = "http://localhost:3000/api/v1/giants/players"
        
        guard var urlComponents = URLComponents(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            do {
                let articles = try JSONDecoder().decode([Player].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    static func fetchSwallows(completion: @escaping ([Player]) -> Swift.Void) {
        
        let url = "http://localhost:3000/api/v1/swallows/players"
        
        guard var urlComponents = URLComponents(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            do {
                let articles = try JSONDecoder().decode([Player].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    static func fetchBaystars(completion: @escaping ([Player]) -> Swift.Void) {
        
        let url = "http://localhost:3000/api/v1/baystars/players"
        
        guard var urlComponents = URLComponents(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            do {
                let articles = try JSONDecoder().decode([Player].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    static func fetchDragons(completion: @escaping ([Player]) -> Swift.Void) {
        
        let url = "http://localhost:3000/api/v1/dragons/players"
        
        guard var urlComponents = URLComponents(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            do {
                let articles = try JSONDecoder().decode([Player].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    static func fetchTigers(completion: @escaping ([Player]) -> Swift.Void) {
        
        let url = "http://localhost:3000/api/v1/tigers/players"
        
        guard var urlComponents = URLComponents(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            do {
                let articles = try JSONDecoder().decode([Player].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    static func fetchCarp(completion: @escaping ([Player]) -> Swift.Void) {
        
        let url = "http://localhost:3000/api/v1/carp/players"
        
        guard var urlComponents = URLComponents(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            do {
                let articles = try JSONDecoder().decode([Player].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
