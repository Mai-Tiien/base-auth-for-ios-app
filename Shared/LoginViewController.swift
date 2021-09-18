//
//  LoginViewController.swift
//  MyAppIos
//
//  Created by mai on 12.09.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var Email: UITextField!
    @IBOutlet var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
    }
    
    
    @IBAction func createAccountTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SingUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}
