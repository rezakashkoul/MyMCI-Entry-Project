//
//  TableViewCell.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/5/1400 AP.
//

import UIKit

let obj = TableViewCell()
class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberOfForksLabel: UILabel!
    @IBOutlet weak var numberOfStarsLabel: UILabel!
    @IBOutlet weak var numberOfWatchesLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    
    @IBAction func sendCommentButton(_ sender: UIButton) {
        sender.resignFirstResponder()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.bounds.height/2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension UIImageView {
    func roundImage()  {
        self.layer.cornerRadius = obj.profileImage.frame.size.width / 2
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 4
    }
}
