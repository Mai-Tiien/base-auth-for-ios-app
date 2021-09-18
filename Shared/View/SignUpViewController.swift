//
//  SignUpViewController.swift
//  MyAppIos
//
//  Created by mai on 12.09.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var Email: UITextField!
    @IBOutlet var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
    }
    
    @IBAction func alreadyHaveAccountLoginTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
}
