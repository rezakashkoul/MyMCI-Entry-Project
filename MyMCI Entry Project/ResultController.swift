//
//  ResultController.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/5/1400 AP.
//

import UIKit
import Alamofire


class ResultController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    // The variable you searched in the first page
    var searchedUsername = String()
    
    //List of results in the array to store and show
    var resultArray = [GitHubData]()
    
    
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var resultTableView: UITableView!
    
    
    //Configuring TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        // setting the data got from json here...
        // cell.usernameLabel.text = resultArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        //return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("The chosen user name is \(searchedUsername)")
        
        
        resultTableView.dataSource = self
        resultTableView.delegate = self
        
        //getting data from GitHub API
        let url = URL(string: "https://api.github.com/users/\(searchedUsername)/repos")
        AF.request(url!).response { response in
            let result = response.data
            do {
                self.resultArray = try JSONDecoder().decode([GitHubData].self, from: result!)
                
                for gitData in self.resultArray {
                    
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
    // Because of UI Designed intentions, I used a custom button to do "back" function
    @IBAction func backPageButton(_ sender: UIButton) {
        
        
    }
    
    // here is the configuration for filter the results
    
    @IBAction func FilterSegment(_ sender: UISegmentedControl) {
    }
    
    
    //another function for sorting results
    
    @IBAction func sortDescendingButton(_ sender: UIButton) {
    }
    
    
}
