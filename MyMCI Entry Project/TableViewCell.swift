//
//  TableViewCell.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/5/1400 AP.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    @IBOutlet weak var numberOfForksLabel: UILabel!
    
    @IBOutlet weak var numberOfStarsLabel: UILabel!
    
    @IBOutlet weak var numberOfWatchesLabel: UILabel!
    
    
    
    
    @IBOutlet weak var commentTextField: UITextField!
    let obj = ResultController()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    
    @IBAction func sendCommentButton(_ sender: UIButton) {
        sender.resignFirstResponder()
        
    }
    
    
    
}
