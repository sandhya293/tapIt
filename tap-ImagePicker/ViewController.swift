//
//  ViewController.swift
//  tap-ImagePicker
//
//  Created by Sandhya Baghel on 05/07/21.
//  Copyright © 2021 Sandhya. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    var p = 10
    var s = 0
    var a = 0
    var state = [0,1,2,
                               3,4,5,
                               6,7,8]
     var name:String = ""
  //  var flag = 0
    var lvu: IndexPath = [0]
    private var zeroFlag = false
     var timerTest : Timer?
     var timer1 : Timer?
    private let btn:UIButton = {
        let button = UIButton()
        button.setTitle("START GAME", for: .normal)
        button.addTarget(self, action: #selector(handleBtn), for: .touchUpInside)
        button.backgroundColor = UIColor.black
        return button
    }()
    private let lbl:UILabel = {
          let label = UILabel()
        label.font = label.font.withSize(30)
        label.textColor = UIColor.black
          return label
      }()
       private let myCollectionView:UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.sectionInset = UIEdgeInsets(top: 12, left: 20, bottom: 20, right: 20)
           layout.itemSize = CGSize(width: 80, height: 127)
           
           
           let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           collectionView.backgroundColor = .white
           return collectionView
       }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(myCollectionView)
        view.addSubview(btn)
         view.addSubview(lbl)
        timer1?.invalidate()
        
         timer1 = nil
        setupCollectionView()
        
          self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back2")!)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         myCollectionView.frame = CGRect(x:40,y:70,width:310,height:450)
         btn.frame = CGRect(x:120,y:620,width:170,height:50)
         lbl.frame = CGRect(x:140,y:550,width:170,height:50)
    }
       
    @objc func handleBtn() {
        //let randomInt = Int.random(in: 0..<8)
        btn.setTitle("STOP GAME", for: .normal)
        timerTest = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    var i = 0
    var temp = -1
    @objc func update()
    {
         i = i + 1;
        lbl.text = "Timer :"+String(i)
       
        temp = state[p]
         state[p] = 9
        self.myCollectionView.reloadItems(at: [lvu])
        if state[p] == 9
        {
                state[p] = temp
        }
    
        if(p==0)
        {
                p = 5
        }
        else if(p==1)
        {
                p = 7
        }
        else if(p==2)
        {
              p = 4
        }
        else if(p==3)
        {
                p = 8
        }
       else if(p==4)
        {
              p = 6
        }
        else if(p==5)
        {
            p = 1
        }
        else if(p==6)
        {
            p = 3
        }
        else if(p==7)
        {
            p = 2
        }
        else if(p==8)
        {
            p = 0
        }
        if(i >= 60)
        {
            timerTest?.invalidate()
            
              timerTest = nil
            print("timer stopped")
        let alert = UIAlertController(title: "Congralutions Your Score Is \(s)", message: "Please Enter Your Name", preferredStyle: .alert)
                 alert.addTextField { (tf) in tf.placeholder = "Enter Your Name"}
                 
                 let action = UIAlertAction(title: "submit", style: .default) { (_) in
                     self.name = (alert.textFields?.first?.text)!
                     UserDefaults.standard.setValue("applePhone123", forKey: "UserToken")
                     UserDefaults.standard.setValue(self.name, forKey: "Name")
                     UserDefaults.standard.setValue(self.s, forKey: "Score")
                     let vc = ScoreBoardVC()
                     self.navigationController?.pushViewController(vc, animated: true)
        
                 }
                 alert.addAction(action)
                 present(alert , animated: true , completion: nil)

        }
    }

   
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    static let kSessionTimer = "sessionTimer"

private func setupCollectionView() {
    myCollectionView.register(gamecell.self, forCellWithReuseIdentifier: "gamecell")
    myCollectionView.dataSource = self
    myCollectionView.delegate = self
    
}

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    9
   
  //  return 9
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"gamecell", for: indexPath) as! gamecell
    
    if(p < 10)
    {
        cell.setupCell(with: &state[indexPath.row],n: state[p],flag:1)
    }
    else if(p == 10)
    {
        p = 0
        cell.setupCell(with: &state[indexPath.row],n: state[p],flag: 0)
        
    }
     
    return cell
}
    

func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
   // a = a + 1
    if state[indexPath.row] == 9
      {
             s = s + 10
           
      }
      else //if state[indexPath.row] == indexPath.row
      {
          s = s - 5
       
      }
    
      print("s = \(s)")
    // print("a = \(a)")

}
}

