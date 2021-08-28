//
//  GitFeed.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/5/1400 AP.
//

import Foundation
import Alamofire

struct GitHubData : Codable {
    var name : String?
    var full_name : String?
    var forks_count : Int
    var watchers_count : Int
    let stargazers_count : Int

}



