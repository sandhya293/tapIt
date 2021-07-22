//
//  gamecell.swift
//  tap-ImagePicker
//
//  Created by Sandhya Baghel on 05/07/21.
//  Copyright © 2021 Sandhya. All rights reserved.
//

import Foundation

import UIKit

class gamecell: UICollectionViewCell {
       var timerTest : Timer?
  private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
 
    
    func setupCell(with status: inout Int,n:Int,flag:Int) {
        
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.black.cgColor
         contentView.addSubview(myImageView)
       //  print("status = \(status)")
        
        myImageView.frame = CGRect(x:-5, y: 0, width: 90, height: 130)
        if(flag == 1 ) //0 0
        {
      
            if(status == n ) //0 0
            {
                  myImageView.image = UIImage(named: "black.jpg")
                timerTest = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(update), userInfo: nil, repeats: true)
            }
           else if(status != n)
            {
                   myImageView.image = UIImage(contentsOfFile: "white.jpg")
            
            }
        }
       }
    
    var i = 1
    @objc func update(){
            i = i + 1;
           if(i >= 5 )
           {
                 timerTest?.invalidate()
               
                 timerTest = nil
            myImageView.image = UIImage(contentsOfFile: "white.jpg")
              
    
        }}
    
}
