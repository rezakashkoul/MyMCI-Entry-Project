import Foundation

//JSON model to catch the data
struct GitHubData : Codable {
    var name : String?
    var full_name : String?
    var forks_count : Int
    var watchers_count : Int
    let stargazers_count : Int
    var owner : GitHubSubData
}
