//
//  ViewController.swift
//  GraviNewton
//
//  Created by Cynara Costa on 24/03/22.
//

// open as a assistante -> hold option and click at the file
//option - command - setinha


import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var gravityValue: UILabel!
    @IBOutlet var stepper: UIStepper!
    
    @IBOutlet var grave: UIImageView!
    @IBOutlet var newtonMimindo: UIImageView!
    @IBOutlet var newtonWhat: UIImageView!
    @IBOutlet var newton: UIImageView!
    @IBOutlet var ideaButton: UIButton!
    
    @IBOutlet var pequenoPopupText: UILabel!
    @IBOutlet var grandePopupText: UILabel!
    @IBOutlet var descobriuPopupText: UILabel!
    
    @IBOutlet var earthButton: UIButton!
    @IBOutlet var moonButton: UIButton!
    @IBOutlet var jupiterButton: UIButton!
    
    @IBOutlet var appleButtonOut: UIButton!
    @IBOutlet var popupInicioView: UIView!
    @IBOutlet var popupPequenoN: UIView!
    @IBOutlet var popupGrandeN: UIView!
    @IBOutlet var popupDescobriu: UIView!
    
    
    @IBOutlet var blurView: UIVisualEffectView!
    
    var timeToShake: Timer?
    
    @IBAction func doneButton(_ sender: Any) {
        animateOut(desiredView: blurView)
        animateOut(desiredView: popupInicioView)
    }
    
    @IBAction func tryAgainPequeno(_ sender: Any) {
        animateOut(desiredView: blurView)
        animateOut(desiredView: popupPequenoN)
    }
    
    @IBAction func tryAgainGrande(_ sender: Any) {
        animateOut(desiredView: blurView)
        animateOut(desiredView: popupGrandeN)
        grave.isHidden = true
        newtonMimindo.isHidden = false
    }
    
    @IBAction func tryAgainDescobriu(_ sender: Any) {
        animateOut(desiredView: blurView)
        animateOut(desiredView: popupDescobriu)
        newton.isHidden = true
        ideaButton.isHidden = true
        newtonMimindo.isHidden = false
    }
    
    @IBAction func appleButton(_ sender: UIButton) {
        timeToShake?.invalidate()
        let velocityAndGravityValue = velocity()
        
        let velocityValue: Float = velocityAndGravityValue.0
        let velocityString: String = String(velocityAndGravityValue.0.rounded(.up))
        let gravityString = String(velocityAndGravityValue.1)
        let timeToFall: Float = timeFall(velocity: velocityValue, gravity: velocityAndGravityValue.1)
        
        
        sender.dropp(timeToFall: timeToFall)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(timeToFall) + 0.5){ [self] in
            if (velocityValue < 10) && (velocityValue >= 0){
                
                let textDifPopup = ", que não é suficiente para ele sentir uma leve dor com a maçã caindo na sua cabeça, não fazendo-o acordar e pensar na famosa e conhecida gravidade!"
                
                boldText(velocityString: velocityString, gravitySring: gravityString, textDifPopUp: textDifPopup, whichPopUp: pequenoPopupText)
                
                DispatchQueue.main.asyncAfter(deadline: .now()){ [self] in
                    animateIn(desiredView: blurView)
                    animateIn(desiredView: popupPequenoN)
                }
                
            } else if (velocityValue > 10) && (20 > velocityValue){
                
                let textDifPopup = ", que é suficiente para ele sentir uma leve dor com a maçã caindo na sua cabeça, fazendo-o acordar e pensar na famosa e conhecida gravidade!"
                
                boldText(velocityString: velocityString, gravitySring: gravityString, textDifPopUp: textDifPopup, whichPopUp: descobriuPopupText)
                
                
                newtonMimindo.isHidden = true
                newtonWhat.isHidden = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){ [self] in
                    
                    newtonWhat.isHidden = true
                    newton.isHidden = false
                    ideaButton.isHidden = false
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){ [self] in
                        animateIn(desiredView: blurView)
                        animateIn(desiredView: popupDescobriu)
                    }
                }
                
                
            } else {
                
                let textDifPopup = ", que é suficiente para fazê-lo perder a cabeça, literalmente!"
                
                boldText(velocityString: velocityString, gravitySring: gravityString, textDifPopUp: textDifPopup, whichPopUp: grandePopupText)
                
                newtonMimindo.isHidden = true
                sleep(UInt32(0.1))
                grave.isHidden = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){ [self] in
                    
                    animateIn(desiredView: blurView)
                    animateIn(desiredView: popupGrandeN)
                    
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){ [self] in
            timeToShake = Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true, block: { [self] _ in
                self.appleButtonOut.shake()
            })}
    }
    
    @IBAction func touchButton(_ sender: UIButton) {
        
        var gravityValuePlanet: Float
        
        if (sender == earthButton){
            gravityValuePlanet = 9.8
        } else if (sender == moonButton){
            gravityValuePlanet = 1.62
        } else{
            gravityValuePlanet = 24.79
        }
        
        gravityValue.text = (Float(gravityValuePlanet).description) + (" m/s²")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupInicioView.layer.cornerRadius = 10
        popupPequenoN.layer.cornerRadius = 10
        popupGrandeN.layer.cornerRadius = 10
        popupDescobriu.layer.cornerRadius = 10
        // if not appleButton IBAction func
        
        timeToShake = Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true, block: { [self] _ in
            self.appleButtonOut.shake()
        })
    }
    
    func animateIn(desiredView: UIView){
        let backgroundView = self.view
        backgroundView?.addSubview(desiredView)
        
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        
        desiredView.center = backgroundView!.center
        
        UIView.animate(withDuration: 0.7, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })
    }
    
    func animateOut(desiredView: UIView){
        UIView.animate(withDuration: 0.7, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }
    
    @IBAction func stepperClickded(_ sender: UIStepper) {
        gravityValue.text = (Float(sender.value).description) + (" m/s²")
    }
    
    
    func velocity() -> (Float, Float){
        
        let gravityValue: String = gravityValue.text ?? "9.8"
        
        let gravityValueModified: String = gravityValue.replacingOccurrences(of: "m/s²", with: "")
        let gravityValueInt: Float = (gravityValueModified as NSString).floatValue
        // considerando a altura da árvore de 10 metros
        let velocityFloat: Float = sqrt(2 * gravityValueInt * 10)
        
        return (velocityFloat, gravityValueInt)
    }
    
    func timeFall(velocity: Float, gravity: Float) -> Float{
        let timeToFall: Float = sqrt((2 * 10) / gravity)
        return timeToFall
    }
    
    fileprivate func setupLayout(){
        stepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepper.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

