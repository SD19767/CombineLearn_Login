//
//  ViewController.swift
//  CombineLearn_Login
//
//  Created by Alvin Tseng on 2023/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.===========
    }

    @IBAction func tapLoginButton(_ sender: Any) {
        let vc = LoginViewController()
        if let sheet =  vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        present(vc, animated: true)
    }
    
}

