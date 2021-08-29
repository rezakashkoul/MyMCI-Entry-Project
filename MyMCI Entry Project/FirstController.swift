//
//  ViewController.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/3/1400 AP.
//

import UIKit
import Alamofire

class FirstController: UIViewController ,UITextFieldDelegate {

    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var searchImageLogo: UIImageView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.usernameTextField.delegate = self

        
    }

    
    
    
    @IBAction func searchButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("text"), object: usernameTextField.text)
        
        
        let alert = UIAlertController(title: "Empty Field!", message: "Please type a GitHub username", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Okay!", style: .cancel, handler: nil))
        
        if usernameTextField.text == "" {
            present(alert,  animated: true)
            

        } else {
            
//            guard let vc = storyboard?.instantiateViewController(identifier: "resultPage") as? ResultController else { return }
//            navigationController?.pushViewController(vc, animated: true)
//
            performSegue(withIdentifier: "showResult", sender: nil)
            let enteredUsername : String = usernameTextField.text!
            print("THIS The USERNAME YOU SEARCHED FOR  \(enteredUsername) ")
            
            
            }
        }
        
    
    
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


