//
//  ViewController.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/3/1400 AP.
//
import UIKit

class FirstController: UIViewController ,UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var searchImageLogo: UIImageView!
    @IBAction func searchButton(_ sender: UIButton) {
        //show the alert message!
        let alert = UIAlertController(title: "Empty Field!", message: "Please type a GitHub username", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay!", style: .cancel, handler: nil))
        if usernameTextField.text == "" {
            present(alert, animated: true)
        } else {
            let newPage = storyboard?.instantiateViewController(identifier: "resultPage") as! ResultController
            newPage.searchedUsername = self.usernameTextField.text!
            navigationController?.pushViewController(newPage, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //for locking app appearance to the light mode
        overrideUserInterfaceStyle = .light
        
        self.usernameTextField.delegate = self
        //show clear button while you write something
        usernameTextField.clearButtonMode = .whileEditing
    }
    //Keyboard needed configurations!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func textFieldShouldReturn(userText: UITextField!) -> Bool {
        usernameTextField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
