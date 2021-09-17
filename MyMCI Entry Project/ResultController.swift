//
//  ResultController.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/5/1400 AP.
//
import UIKit

class ResultController: UIViewController , UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate {
    
    @IBOutlet weak var segmentState: UISegmentedControl!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var resultTableView: UITableView!
    @IBAction func backPageButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func FilterSegment(_ sender: UISegmentedControl) {
        segmentManagement()
    }
    @IBAction func sortDescendingButton(_ sender: UIButton) {
    }
    var searchedUsername = String()
    var resultArray = [GitHubData]()
    
    func directSearch() {
        searchedUsername = searchField.text!
        gettingDataFromApi()
        resultTableView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.resignFirstResponder()
        directSearch()
        return true
    }
    
    func segmentManagement() {
        if segmentState.selectedSegmentIndex == 0 {
            //stars
            resultArray = resultArray.sorted(by: { githubValue1, githubValue2 in
                githubValue1.stargazers_count < githubValue2.stargazers_count
            })
        } else if segmentState.selectedSegmentIndex == 1 {
            // forks
            resultArray = resultArray.sorted(by: { githubValue1, githubValue2 in
                githubValue1.forks_count < githubValue2.forks_count
            })
        } else if segmentState.selectedSegmentIndex == 2 {
            // watches
            resultArray = resultArray.sorted(by: { githubValue1, githubValue2 in
                githubValue1.watchers_count < githubValue2.watchers_count
            })
        }
        resultTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let finalResultArray = resultArray[indexPath.row]
        cell.usernameLabel.text = finalResultArray.name
        cell.nameLabel.text = searchedUsername
        cell.numberOfForksLabel.text = String(finalResultArray.forks_count)  + " Forks"
        cell.numberOfStarsLabel.text = String(finalResultArray.stargazers_count) + " Stars"
        cell.numberOfWatchesLabel.text = String(finalResultArray.watchers_count) + " Watches"
        
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
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // Hide the navigation bar on the this view controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: !animated)
    }
    // Show the navigation bar on other view controllers
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: !animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("The chosen user name is \(searchedUsername)")
        segmentState.selectedSegmentIndex = 1
        segmentManagement()
        overrideUserInterfaceStyle = .light
        resultTableView.keyboardDismissMode = .onDrag
        searchField.clearButtonMode = .whileEditing
        searchField.delegate = self
        resultTableView.dataSource = self
        resultTableView.delegate = self
        //***Getting Data from API***
        gettingDataFromApi()
    }
    
    func gettingDataFromApi() {
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
}
