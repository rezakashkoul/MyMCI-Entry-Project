//
//  ResultController.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/5/1400 AP.
//

import UIKit

class ResultController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    // The variable you searched in the first page (for passing Data)
    public var searchedUsername = String()
    
    
    //List of results in the array to store and show
    var resultArray = [GitHubData]()
    
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var resultTableView: UITableView!
    
    
    
    //Configuring TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let finalResultArray = resultArray[indexPath.row]
        cell.usernameLabel.text = finalResultArray.name
        cell.nameLabel.text = searchedUsername
        cell.numberOfForksLabel.text = String(finalResultArray.forks_count)
        cell.numberOfStarsLabel.text = String(finalResultArray.stargazers_count)
        cell.numberOfWatchesLabel.text = String(finalResultArray.watchers_count)
        
        //cell.commentTextField.text = name
        
        
        //Configuring Image materials
        let urlString = finalResultArray.owner.avatar_url!
        
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //for locking app appearance to the light mode
        overrideUserInterfaceStyle = .light
        print("The chosen user name is \(searchedUsername)")
        
        //show clear button while you write something
        searchField.clearButtonMode = .whileEditing
        
        resultTableView.dataSource = self
        resultTableView.delegate = self
        
        //***Getting Data from API***
        let urlString =  "https://api.github.com/users/\(searchedUsername)/repos"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let gitHUbJson = try? decoder.decode([GitHubData].self, from: json) {
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
