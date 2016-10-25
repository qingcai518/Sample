//
//  InfoDetailController.swift
//  Sample
//
//  Created by user on 2016/10/25.
//  Copyright © 2016年 uluru. All rights reserved.
//

import UIKit

class InfoDetailController: UIViewController {
    @IBOutlet var textLbl: UILabel!
    
    // param.
    var text: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        textLbl.text = text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
