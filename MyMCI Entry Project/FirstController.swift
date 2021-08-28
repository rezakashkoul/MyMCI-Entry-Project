//
//  ViewController.swift
//  MyMCI Entry Project
//
//  Created by Reza Kashkoul on 6/3/1400 AP.
//

import UIKit
import Alamofire

class FirstController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var searchImageLogo: UIImageView!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        AF.request("https://api.github.com/users/\(usernameTextField.text ?? "alireza12t")/repos").response {
//            response in debugPrint(response)
//
//            
//        }
        
        

        
        
    }

    

    
    @IBAction func searchButton(_ sender: UIButton) {
        usernameTextField.resignFirstResponder()
        let alert = UIAlertController(title: "Empty Field!", message: "Please type a GitHub username", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Okay!", style: .cancel, handler: nil))
        let userEnteredText = usernameTextField.text
        if userEnteredText == "" {
            present(alert,  animated: true)
            
        } else {
            
            guard let vc = storyboard?.instantiateViewController(identifier: "resultPage") as? ResultController else { return }
            navigationController?.pushViewController(vc, animated: true)
            
            struct HTTPBinResponse: Decodable { let url: String }

            AF.request("https://api.github.com/users/\(usernameTextField.text ?? "reza-kashkoul")/repos").responseDecodable(of: HTTPBinResponse.self) { response in
                debugPrint("Response: \(response)")
            }
            
        
            }
        }
        
    
    
    
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showResult" {
//            let controller = segue.destination as! ResultController
//            present(controller, animated: true)
//        }
//    }
}

