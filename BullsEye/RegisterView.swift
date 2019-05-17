//
//  RegisterView.swift
//  2048
//
//  Created by Davids Markovs on 21/04/2019.
//  Copyright © 2019 Davids Markovs. All rights reserved.
//

import UIKit

class RegisterView: UIViewController {

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var RepeatPassword: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func RegisterButtonPressed(_ sender: Any) {
        let userEmailText = userEmail.text;
        let userPassword = Password.text;
        let userPasswordRepeat = RepeatPassword.text;
        
        if(userEmailText!.isEmpty || userPassword!.isEmpty || userPasswordRepeat!.isEmpty){
            displayAlertMessage(userMessage: "All field must contain info")
            //ALert
            return;
        }
        if(userPassword != userPasswordRepeat){
            displayAlertMessage(userMessage: "Passwords dont match");           return;
        }
        UserDefaults.standard.set(userEmailText, forKey: "userEmailText");
        UserDefaults.standard.set(userPassword, forKey: "userPassword");
        let alert = UIAlertController(title:"ALERT", message: "Registration is successful", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default){action in self.dismiss(animated: true, completion: nil)}
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayAlertMessage(userMessage: String){
        let alert = UIAlertController(title:"ALERT", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler:  nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
