//
//  ResultController.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/5/1400 AP.
//

import UIKit
import Alamofire



//struct GitHubData : Codable {
//    var name : String?
//    var full_name : String?
//    var forks_count : Int
//    var watchers_count : Int
//    let stargazers_count : Int
//
//}


class ResultController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var searchField: UITextField!
    
    var resultArray = [GitHubData]()
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
// setting the data got from json here...
                
//        cell.usernameLabel.text = resultArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        //return resultArray.count
    }
    
    @IBOutlet weak var resultTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView.dataSource = self
        resultTableView.delegate = self
        
        let url = URL(string: "https://api.github.com/users/alireza12t/repos")
        AF.request(url!).response { response in
            let result = response.data
            do {
                self.resultArray = try JSONDecoder().decode([GitHubData].self, from: result!)
                
                for gitData in self.resultArray {
//                    print(gitData.name!, ":", gitData.full_name!)
                    print("""
                    The name is \(gitData.name!) ,
                    The full name is \(gitData.full_name!) ,
                    The forks count is \(gitData.forks_count) ,
                    The watchers count is \(gitData.watchers_count) ,
                    The stargazers count is \(gitData.stargazers_count)
                    """)
                    
                    
                    
                    
                }
            } catch  {
                print("***Error***")
            }
            
            
            
        }
        
    
        
        
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
