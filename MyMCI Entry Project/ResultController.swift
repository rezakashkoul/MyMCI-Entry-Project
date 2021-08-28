//
//  ResultController.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/5/1400 AP.
//

import UIKit
import Alamofire


struct GitHubData : Codable {
    var name : String?
    var full_name : String?

    //    let forks_count : Int
//    let watchers_count : Int
//    let stargazers_count : Int

}





class ResultController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var searchField: UITextField!
    
    var searchIndexedArray = [GitHubData]()
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
// setting the data got from json here...
        
        
//        cell.usernameLabel.text = searchIndexedArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchIndexedArray.count
    }
    
    @IBOutlet weak var resultTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView.dataSource = self
        resultTableView.delegate = self
        
        let url = URL(string: "https://api.github.com/users/reza-kashkoul/repos")
        AF.request(url!).response { response in
            let result = response.data
            do {
                self.searchIndexedArray = try JSONDecoder().decode([GitHubData].self, from: result!)
                
                for gitData in self.searchIndexedArray {
                    print(gitData.name!, ":", gitData.full_name!)
                }
            } catch  {
                print("***Error***")
            }
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        

//        struct HTTPBinResponse: Decodable { let url: String }
//
//        AF.request("https://api.github.com/users/reza-kashkoul/repos").responseDecodable(of: HTTPBinResponse.self) { response in
//            debugPrint("Response: \(response)")
//        }
        
        
        
    }
    
    @IBAction func backPageButton(_ sender: UIButton) {
//
        
        
    }

    
    

    
    
    
        

        
        
        
//    @IBAction func starFilterButton(_ sender: Any) {
//    }
//
//    @IBAction func forkFilterButton(_ sender: UIButton) {
//    }
//
//    @IBAction func watchFilterButton(_ sender: UIButton) {
//    }
    
    
    
    @IBAction func FilterSegment(_ sender: UISegmentedControl) {
    }
    
    
    
    
    @IBAction func sortDescendingButton(_ sender: UIButton) {
    }
    
    
}
