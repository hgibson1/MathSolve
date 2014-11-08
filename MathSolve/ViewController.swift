//
//  ViewController.swift
//  MathSolve
//
//  Created by Hannah Gibson on 10/11/14.
//  Copyright (c) 2014 Hannah Gibson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var ALabel: UILabel!
    //Number A label
   

    @IBOutlet weak var Opperation: UILabel!
    //Opperation label
    
    @IBOutlet weak var BLabel: UILabel!
    //Number B label
    
    
    @IBOutlet weak var Answer: UITextField!
    //Answer Text field
    
    @IBOutlet weak var Feedback: UILabel!
    //Feedback label
    
    var correctAnswer = -1;
    
    func setLabels(sender: AnyObject){
        
        let A = Int(arc4random_uniform(100));
        //let generates varible as constant, var generates varible as varbile/can be generated many times
        ALabel.text = "\(A)" //converts A to string and displays in ALabel
        ALabel.textColor = UIColor.whiteColor()
        ALabel.backgroundColor = UIColor.blackColor()
        
        let B = Int(arc4random_uniform(100));
        BLabel.text = "\(B)" //converts B to string and displays in BLabel
        BLabel.textColor = UIColor.whiteColor()
        BLabel.backgroundColor = UIColor.blackColor()
        
        
        let oppNum = Int(arc4random_uniform(4));
        switch (oppNum){
        case 0:
            Opperation.text = "+"
            correctAnswer = A + B;
        case 1:
            Opperation.text = "-"
            correctAnswer = A - B;
        case 2:
            Opperation.text = "*"
            correctAnswer = A * B;
        case 3:
            Opperation.text = "/"
            correctAnswer = A / B;
        default:
            Opperation.text = "+"
            correctAnswer = A + B;
        }
        
        Opperation.textColor = UIColor.whiteColor()
        Opperation.backgroundColor = UIColor.blackColor()
        
        Answer.text = "" //initalizes answer textfield
        Feedback.text = "" //initalizes feedback label
        Feedback.backgroundColor = UIColor.blackColor()
    }
    
    override func motionEnded(_motion: UIEventSubtype,
        withEvent event: UIEvent){
            setLabels(self)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        setLabels(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        let userAnswer = Answer.text.toInt()
        if userAnswer == correctAnswer {
           
            Feedback.text = "Right :)"
            Feedback.textColor = UIColor.whiteColor()
            Feedback.backgroundColor = UIColor.greenColor()
            return true
            
        }
        else {
            
            Feedback.text = "Wrong :("
            Feedback.textColor = UIColor.whiteColor()
            Feedback.backgroundColor = UIColor.redColor()
            return false
            }
    }
}

