//
//  GitFeed.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/5/1400 AP.
//

import Foundation
import Alamofire


//JSON model to catch the data
struct GitHubData : Codable {
    var name : String?
    var full_name : String?
    var forks_count : Int
    var watchers_count : Int
    let stargazers_count : Int
    //  let avatar_url: UIImage?
    
}


//class ImageDownloader: Codable {
//    
//
//
//func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//}
//
//func downloadImage(from url: URL) {
//    print("Download Started")
//    getData(from: url) { data, response, error in
//        guard let data = data, error == nil else { return }
//        print(response?.suggestedFilename ?? url.lastPathComponent)
//        print("Download Finished")
//        // always update the UI from the main thread
//        DispatchQueue.main.async() { [weak self] in
//            profileImage.image = UIImage(data: data) as? TableViewCell
//            }
//        }
//    }
//}
