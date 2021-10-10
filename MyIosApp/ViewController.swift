//
//  ViewController.swift
//  MyIosApp
//
//  Created by mai on 19.09.2021.
//
import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController , UITextFieldDelegate {

   
    @IBOutlet var Email: UITextField!
    @IBOutlet var Password: UITextField!
    @IBOutlet var SignUpButton: UIButton!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Email.delegate = self
        Password.delegate = self
        Email.layer.cornerRadius = 20
        Password.layer.cornerRadius = 20
        SignUpButton.layer.cornerRadius = 12
    }

    @IBAction func signUpTapped(_ sender: Any) {
        if Email.text?.isEmpty == true {
            print("No text in email field")
            return
        }
        if Password.text?.isEmpty == true {
            print("No text in password field")
            return
        }
        
        signUP()
    }
    
    @IBAction func alreadyHaveAccountTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func signUP(){
        Auth.auth().createUser(withEmail: Email.text!, password: Password.text!){ (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
            
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "mainHome")
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
        }
    }
    
}


