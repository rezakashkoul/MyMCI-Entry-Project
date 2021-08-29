//
//  GitFeed.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/5/1400 AP.
//

import Foundation
//import Alamofire


//JSON model to catch the data
struct GitHubData : Codable {
    var name : String?
    var full_name : String?
    var forks_count : Int
    var watchers_count : Int
    let stargazers_count : Int
    let owner: [ProfileAvatar]
    //avatar_url link is https://avatars.githubusercontent.com/u/31301632?v=4
    
    //let comments_url : String?
    //comments link is https://api.github.com/repos/USERNAME/MagicButton/comments{/number}
    
    
    
    
    
    //   var userDetail : [(avatar_url: UIImage , full_name: String , name: String , stargazers_count : Int , forks_count : Int , watchers_count : Int , comments_url : String )] = []
    
    
    
}


//class ProfilePicture : Codable  {
//    let avatar_url: UIImage? = nil
//}


class ProfileAvatar: Codable {
    var avatar_url : String?

        func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        
    }
}
