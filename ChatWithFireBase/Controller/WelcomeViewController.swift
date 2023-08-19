//
//  ViewController.swift
//  ChatWithFireBase
//
//  Created by Admin on 15.08.23.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animationLabel()
    }
    func animationLabel() {
        titleLabel.text = ""
        let titleText = K.appName
        var count = 0.0
        for i in titleText {
            count += 1
            Timer.scheduledTimer(withTimeInterval: 0.1 * count, repeats: false) { timer in
                self.titleLabel.text?.append(i)
            }
            
        }
    }

}

