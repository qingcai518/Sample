//
//  LoginController.swift
//  Sample
//
//  Created by user on 2016/10/24.
//  Copyright © 2016年 uluru. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var userName : UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doLogin(sender: Any) {
        showAlert(isSuccess: checkInput())
    }
    
    private func checkInput() -> Bool {
        guard let user = userName.text else {return false}
        guard let pass = password.text else {return false}
        if (user != "test" || pass != "123456") {
            return false
        }
        
        return true
    }
    
    private func showAlert(isSuccess: Bool) {
        if isSuccess {
            let storyboard = UIStoryboard(name: "InfoList", bundle: nil)
            guard let next = storyboard.instantiateInitialViewController() else {return}
            self.present(next, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "fail", message: "ログイン失敗しました。\nユーザ名またはパスワードが不正です。", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(actionOK)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
