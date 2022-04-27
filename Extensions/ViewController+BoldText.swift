//
//  ViewController+BoldText.swift
//  GraviNewton
//
//  Created by Cynara Costa on 05/04/22.
//

import UIKit

extension ViewController{
    
    func boldText(velocityString: String, gravitySring: String, textDifPopUp: String, whichPopUp: UILabel){
        let boldAttribute = [
            NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 15.0)!
        ]
        
        let regularAttribute = [
            NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Regular", size: 15.0)!
        ]
        
        let firstString = NSAttributedString(string: "Isso pois com a gravidade ", attributes: regularAttribute)
        let gravityString = NSAttributedString(string: gravitySring + " m/s² ", attributes: boldAttribute)
        let thirdString = NSAttributedString(string: ", a velocidade foi de ", attributes: regularAttribute)
        let velocityString = NSAttributedString(string: velocityString  +  " m/s " , attributes: boldAttribute)
        let fifthString = NSAttributedString(string: textDifPopUp, attributes: regularAttribute)
        
        let newString = NSMutableAttributedString()
        newString.append(firstString)
        newString.append(gravityString)
        newString.append(thirdString)
        newString.append(velocityString)
        newString.append(fifthString)
        
        whichPopUp.attributedText = newString
        
    }
}
