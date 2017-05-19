//
//  PopTheBalloonViewController.swift
//  Beats Music Player
//
//  Created by Qani Qaniu on 18/5/17.
//  Copyright © 2017 Qani Qaniu. All rights reserved.
//

import UIKit

class PopTheBalloonViewController: UIViewController {
    
    var gameTimer: Timer?
    var gravity: UIGravityBehavior?
    var animator: UIDynamicAnimator?
    var counter: Int = 0
    
    @IBOutlet weak var score: UILabel!
    
    @IBAction func resetScore(_ sender: UIBarButtonItem) {
        
        counter = 0
        score.text = "0"
    }
    
    func addBalloons( _: Any){
        
        let xCoordinate = arc4random() % UInt32(self.view.bounds.width)
        
        let btn = UIButton(frame: CGRect(x: Int(xCoordinate), y: 60, width: 50, height: 50))
        btn.setImage(UIImage(named : "Balloon"), for: .normal)
        btn.addTarget(self, action: #selector(self.didPopBalloon(sender:)), for: .touchUpInside )
        self.view.addSubview(btn)
        
        gravity?.addItem( (btn as UIView))
        
    }
    
    func didPopBalloon(sender : UIButton){
        
        sender.setImage(UIImage(named : "PoppedBalloon"), for: .normal)
        UIView.animate(withDuration: 0.4,
                       animations: {sender.alpha = 0},
                       completion: {(true) in sender.removeFromSuperview()})
        counter += 1
        score.text = "\(counter)"
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameTimer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(PopTheBalloonViewController.addBalloons(_ :)),
                                         userInfo: nil, repeats: true)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: [])
        
        let vector = CGVector(dx: 0.0, dy: 0.1)
        gravity?.gravityDirection = vector
        animator?.addBehavior(gravity!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

