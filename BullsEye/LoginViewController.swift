//
//  LoginViewController.swift
//  2048
//
//  Created by Davids Markovs on 21/04/2019.
//  Copyright © 2019 Davids Markovs. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginButtonPressed(_ sender: Any) {
    
        let userEmailText = userEmail.text
        let userPasswordText = userPassword.text
        
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmailText");
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
    
        if (userEmailStored == userEmailText){
            if (userPasswordStored == userPasswordText){
                //login successful
                UserDefaults.standard.set(true,forKey:"isUserLoggedIn");
                UserDefaults.standard.synchronize();
            }
            else{
                displayAlertMessage(userMessage: "Password Not Correct")
                //ALert
                return;
            }
        }else{
            displayAlertMessage(userMessage: "UserName Not Correct")
            //ALert
        }
        
    }
    func displayAlertMessage(userMessage: String){
        let alert = UIAlertController(title:"ALERT", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler:  nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    

}
