//
//  ViewController.swift
//  multiples
//
//  Created by Geoffrey d'Alelio on 11/28/17.
//  Copyright © 2017 BigIdeaSoftware. All rights reserved.
/*
***********************************************************************************
 * Abstract:   Multiples is an application that will take the number             **
 *             entered into the textFiled to add it multiple times to            **
 *             itself and show the updated total as it increases until the       **
 *             hard coded number of multiples is reached. Then the game resets.  **
 ***********************************************************************************
 */
 
 
 
 
import UIKit

class ViewController: UIViewController {
   
   //add variables
   var numForMultiples = 0
   var oldValue = 0
   var newValue = 0
   var totalValue = 0
   var counter = 0, maxAdds = 5
   
   //add Constants
   let numAddCycles = 5  //constant value for number of cycles to add

   //add outlets
   @IBOutlet weak var playBtn: UIButton!
   @IBOutlet weak var bkgndImg: UIImageView!
   @IBOutlet weak var numMultiplesTxtFld: UITextField!
   @IBOutlet weak var gameLogo: UIImageView!
   @IBOutlet weak var resultLabel: UILabel!
   @IBOutlet weak var addBtn: UIButton!           //the add image is what is to be pushed to continue
   
   
   //add the action for play button being pushed
   @IBAction func onPlayButton(sender: UIButton!) {
     
       if numMultiplesTxtFld.text != nil && numMultiplesTxtFld.text != "" {
 
      //hide the play and display the add & results buttons
      addBtn.isHidden = false
      playBtn.isHidden = true
      resultLabel.isHidden = false

      //get number for multiples from text field
      numForMultiples = Int(numMultiplesTxtFld.text!)!
      newValue = numForMultiples
         
      }
   }
   
   func updateMultipleTotal(){
      totalValue = oldValue + newValue
      resultLabel.text = "\(oldValue) + \(newValue) = \(totalValue)"
      oldValue = totalValue
   }
   
   //check to see if game is over
   func gameIsOver() -> Bool {
      if counter >= maxAdds {
        return true
      } else {
         return false
      }
   }
   
   
   //reset calculations
   func restartGame() {
     playBtn.isHidden = false
     addBtn.isHidden = true
     oldValue = 0
     newValue = 0
     totalValue = 0
     numForMultiples = 0
      counter = 0
      resultLabel.text = ""
      numMultiplesTxtFld.text = ""
     
    
   }
   
   @IBAction func addMultipleValues(sender: UIButton!){
      counter = counter + 1
      updateMultipleTotal()
      if gameIsOver() {
         restartGame()
      }
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      addBtn.isHidden = true
      playBtn.isHidden = false
      
   
   }
}

