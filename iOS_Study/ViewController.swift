//
//  ViewController.swift
//  iOS_Study
//
//  Created by 김응관 on 2021/10/06.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "👻", on: sender)
    }
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for : UIControl.State.normal)
            button.backgroundColor = UIColor.orange
        } else {
            button.setTitle(emoji, for : UIControl.State.normal)
            button.backgroundColor = UIColor.white
        }
    }
    
}

