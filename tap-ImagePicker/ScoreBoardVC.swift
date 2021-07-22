//
//  ScoreBoardVC.swift
//  tap-ImagePicker
//
//  Created by Sandhya Baghel on 21/07/21.
//  Copyright © 2021 Sandhya. All rights reserved.
//

import Foundation

import UIKit

class ScoreBoardVC: UIViewController {
   
    let name = UserDefaults.standard.string(forKey: "Name")
    let score = UserDefaults.standard.string(forKey: "Score")
    
    private let Name : UILabel = {
         let label = UILabel()
          label.text = "Name"
          label.textColor = .brown
          label.font = label.font.withSize(30)
          label.font = .boldSystemFont(ofSize: 20)
          label.textAlignment = .center
          return label
      }()
      private let Score : UILabel = {
         let label = UILabel()
          label.text = "Score"
          label.textColor = .brown
          label.font = label.font.withSize(30)
          label.font = .boldSystemFont(ofSize: 20)
          label.textAlignment = .center
          return label
      }()
      
      private let Nametxt : UILabel = {
         let label = UILabel()
          label.text = ""
          label.textColor = .white
          label.font = label.font.withSize(30)
          label.font = .boldSystemFont(ofSize: 20)
          label.textAlignment = .center
          return label
      }()
      private let Scoretxt : UILabel = {
         let label = UILabel()
          label.text = ""
          label.textColor = .white
          label.font = label.font.withSize(30)
          label.font = .boldSystemFont(ofSize: 20)
          label.textAlignment = .center
          return label
      }()
    
    override func viewDidLoad() {
           super.viewDidLoad()
           self.view.backgroundColor = .black
           Nametxt.text = name
           Scoretxt.text = score
          
           view.addSubview(Name)
           view.addSubview(Score)
           view.addSubview(Nametxt)
           view.addSubview(Scoretxt)

           // Do any additional setup after loading the view.
       }
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
          
           Name.frame = CGRect(x: 20, y: 80, width: 150, height: 50)
           Score.frame = CGRect(x: 260, y:80, width: 90, height: 50)
           Nametxt.frame = CGRect(x: 20, y: 150, width: 150, height: 50)
           Scoretxt.frame = CGRect(x: 260, y: 150, width: 90, height: 50)
           
       }
       
    
  
  
    }
