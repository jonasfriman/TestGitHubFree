//
//  ViewController.swift
//  ControllFun
//
//  Created by Jonas Friman on 2015-05-02.
//  Copyright (c) 2015 Jonas.Friman90. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var RightSwitch: UISwitch!
    @IBOutlet weak var doSomethingButton: UIButton!

    @IBAction func sliderChange(sender: UISlider) {
        let progress = lroundf(sender.value)
        sliderLabel.text = "\(progress)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderLabel.text = "50"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func switchChanged(sender: UISwitch) {
        let setting = sender.on
        leftSwitch.setOn(setting, animated: true)
        RightSwitch.setOn(setting, animated:true)
    }

    @IBAction func toggleControls(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            leftSwitch.hidden = false
            RightSwitch.hidden = false
            doSomethingButton.hidden = true
        } else {
            leftSwitch.hidden = true
            RightSwitch.hidden = true
            doSomethingButton.hidden = false
        }
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        let controller = UIAlertController(title: "Are You Sure?",
            message:nil, preferredStyle: .ActionSheet)
        
        let yesAction = UIAlertAction(title: "Yes, I'm sure!",
            style: .Destructive, handler: { action in
                let msg = self.nameField.text.isEmpty
                    ? "You can breathe easy, everything went OK."
                    : "You can breathe easy, \(self.nameField.text),"
                    + " everything went OK."
                let controller2 = UIAlertController(title:"Something Was Done",
                    message: msg, preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Phew!", style: .Cancel, handler: nil)
                controller2.addAction(cancelAction)
                self.presentViewController(controller2, animated: true, completion: nil)
        })
        
        let noAction = UIAlertAction(title: "No way!",
            style: .Cancel, handler: nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        
        presentViewController(controller, animated: true, completion: nil)
    }
}


