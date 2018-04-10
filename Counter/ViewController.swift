//
//  ViewController.swift
//  Counter
//
//  Created by 吳德彥 on 09/04/2018.
//  Copyright © 2018 吳德彥. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var ellipseView: EllipseView!
    @IBOutlet weak var countTextField: UITextField!
    
    var currentCount: Int = 0 {
        didSet{
            if self.currentCount < 0{
                self.currentCount = 0
            } else {
                updateLabel(animated: false)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for button in self.buttons {
            button.layer.borderColor = button.tintColor.cgColor
            button.layer.borderWidth = 2.0
            button.layer.cornerRadius = 10
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabel(animated: Bool = false) {
        if animated {
            UIView.animate(withDuration: 0.25, animations: {
                self.countTextField.layer.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 1, 0)
            }, completion: { (completed: Bool) in
                UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveLinear, animations: {
                    self.countTextField.layer.transform = CATransform3DIdentity
                }, completion: nil)
                self.countTextField.text = "\(self.currentCount)"
            })
        } else {
            self.countTextField.text = "\(self.currentCount)"
        }
    }

    @IBAction func increaseCounter(_ sender: UIButton) {
        self.countTextField.resignFirstResponder()
        currentCount += 1

    }
    
    @IBAction func decreaseCounter(_ sender: UIButton) {
         self.countTextField.resignFirstResponder()
        currentCount -= 1
       
    }
    @IBAction func resetCounter(_ sender: UIButton) {
        self.countTextField.resignFirstResponder()
        currentCount = 0
    }
    @IBAction func showKeyboard(_ sender: UIButton) {
        countTextField.becomeFirstResponder()
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        countTextField.resignFirstResponder()
    }

    @IBAction func textFieldDidEdit(_ sender: Any) {
        // Get number text
        guard let text = self.countTextField.text, let number = Int(text) else {
            return
        }
        self.currentCount = number
    }
}

