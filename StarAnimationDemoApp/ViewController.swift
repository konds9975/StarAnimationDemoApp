//
//  ViewController.swift
//  StarAnimationDemoApp
//
//  Created by Kondya on 19/03/19.
//  Copyright © 2019 Kondya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageView1 : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView1 = UIImageView(frame: CGRect(x:self.view.frame.width/2, y: self.view.frame.height/2, width: 50, height: 50))
        imageView1.image = UIImage(named: "image2")
        self.view.addSubview(imageView1)

        self.rotateView(sender:imageView1 )
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func rotateView(sender: UIImageView) {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: { () -> Void in
            sender.transform = sender.transform.rotated(by: CGFloat(Double.pi / 4))
        }, completion: { _ in
            self.rotateView(sender: sender)
        })
     
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.view)
        
        let imageView = UIImageView(frame: CGRect(x: location.x, y: location.y, width: 20, height: 20))
        imageView.image = UIImage(named: "image2")
        self.view.addSubview(imageView)
       
        UIView.animate(withDuration: 5, animations: {
            imageView.frame = CGRect(x:  Int(arc4random() % UInt32(self.view.frame.width - 10)), y:  Int(arc4random() %  UInt32(self.view.frame.width - 10)), width: 10, height: 10)
        }, completion: { _ in
            imageView.removeFromSuperview()
        })
    }
}

