//
//  ResultController.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/5/1400 AP.
//

import UIKit

class ResultController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var searchField: UITextField!
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    @IBOutlet weak var resultTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView.dataSource = self
        resultTableView.delegate = self
        
    }
    
    @IBAction func backPageButton(_ sender: UIButton) {
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
