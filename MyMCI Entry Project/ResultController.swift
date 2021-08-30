//
//  ResultController.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/5/1400 AP.
//

import UIKit
import Alamofire


class ResultController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    //    var userDetail : [(ownerImage: UIImage , ownerName: String , name: String , stars : Int , forks : Int , watchers : Int , comment : String )] = []
    
    
    
    // The variable you searched in the first page (for passing Data)
    public var searchedUsername = String()
    
    
    
    
    //List of results in the array to store and show
    var resultArray = [GitHubData]()
    var secondResultArray = [GitHubSubData]()
    
    
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var resultTableView: UITableView!
    
    
    
    //Configuring TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let finalResultArray = resultArray[indexPath.row]
        
        cell.usernameLabel.text = searchedUsername
        cell.nameLabel.text = finalResultArray.name
        cell.numberOfForksLabel.text = String(finalResultArray.forks_count)
        cell.numberOfStarsLabel.text = String(finalResultArray.stargazers_count)
        cell.numberOfWatchesLabel.text = String(finalResultArray.watchers_count)

         //cell.commentTextField.text = name
        
        
        //Configuring Image materials
        let urlString = "\(finalResultArray.owner)"
        
        func fetchImage() {
            guard let url = URL(string: urlString) else { return }
            let getDataTask = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data , error == nil else {
                    return
                }
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    cell.profileImage.image = image
                    
                }
            }
            getDataTask.resume()
        }
        fetchImage()
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return resultArray.count
        
        //just for test!
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//###################################
    
    //These variables are set to bring data back from inner functions of JSON
//    var name = String()
//    var fullName = String()
//    var numberOfForks = Int()
//    var numberOfWwatchers = Int()
//    var numberOfStargazers = Int()
//    var avatarLink = String()
    
    //###################################

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //for locking app appearance to the light mode
        overrideUserInterfaceStyle = .light
        
        print("The chosen user name is \(searchedUsername)")
        
        //show clear button while you write something
        searchField.clearButtonMode = .whileEditing
        
        resultTableView.dataSource = self
        resultTableView.delegate = self
        
        
        
        
        //getting data from GitHub API
//        let url = URL(string: "https://api.github.com/users/\(searchedUsername)/repos")
//        AF.request(url!).response { [self] response in
//            let result = response.data
//            do {
//                self.resultArray = try JSONDecoder().decode([GitHubData].self, from: result!)
//
//                print("***LOG***\([resultArray])***LOG***")
                
                
                //###################################
//                for gitData in self.resultArray {
//
//                    print("""
//
//                    The name is \(gitData.name!) ,
//                    The full name is \(gitData.full_name!) ,
//                    The forks count is \(gitData.forks_count) ,
//                    The watchers count is \(gitData.watchers_count) ,
//                    The stargazers count is \(gitData.stargazers_count),
//                    The Profile Link is \(gitData.owner.avatar_url!)
//
//                    """)
//                //###################################

//
//                    self.name = gitData.name!
//                    self.fullName = gitData.full_name!
//                    self.numberOfForks = gitData.forks_count
//                    self.numberOfWwatchers = gitData.watchers_count
//                    self.numberOfStargazers = gitData.stargazers_count
//                    self.avatarLink = gitData.owner.avatar_url!
                    
                 //###################################

                
//
//
//
//
//
//            } catch  {
//                print("***Error***" )
//
//                let alert = UIAlertController(title: "Search Field!", message: "Please type a valid username", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Let's Try!", style: .cancel, handler: nil))
//                self.present(alert, animated: true)
//
//            }
//
//        }.resume()
//
        
        
        let urlString =  "https://api.github.com/users/\(searchedUsername)/repos"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)

            }
        }
        
 

        
    }
    
    
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let gitHUbJson = try? decoder.decode(GitHubSubData.self, from: json) {
            resultArray = gitHUbJson
            resultTableView.reloadData()
            
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

