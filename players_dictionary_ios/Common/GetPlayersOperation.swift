//
//  GetPlayersOperation.swift
//  players_dictionary_ios
//
//  Created by 山崎浩毅 on 2019/04/30.
//  Copyright © 2019年 山崎浩毅. All rights reserved.
//

import UIKit

class GetPlayersOperation: NSObject {
    func get(url urlString: String) -> Void {
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let queue = OperationQueue.main
        NSURLConnection.sendAsynchronousRequest(request, queue: queue) { response, data, error in
            if let response = response, let data = data {
                print(response)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(json)
                } catch {
                    print("")
                }
            } else {
                print(error ?? "")
            }
        }
    }
    
}
