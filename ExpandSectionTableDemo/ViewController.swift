//
//  ViewController.swift
//  ExpandSectionTableDemo
//
//  Created by sseen on 2017/4/7.
//  Copyright © 2017年 sseen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dataSource = [[1,2,3],[4,5,6]]
    var isCollapse = false
    var indexSelectedSection = -1
    
    @IBOutlet weak var mainTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == indexSelectedSection && isCollapse {
            return 0
        } else {
            return dataSource[section].count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 42
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        let imv = UIImageView(image: #imageLiteral(resourceName: "webForward.pdf"))
        
        lbl.backgroundColor = UIColor.white
        lbl.layer.masksToBounds = true
    
        view.tag = section
        view.backgroundColor = UIColor.cyan
        lbl.text = "hel"
        lbl.textColor = UIColor.black
        imv.tag = 1001
        imv.frame = CGRect(x: 70, y: 5, width: 30, height: 30)
        
        view.addSubview(lbl)
        view.addSubview(imv)
        
        // add gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ckHeader(_:)))
        tapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGesture)
        
        return view
    }
    
    func ckHeader(_ sender:UIGestureRecognizer) {
        let index:Int = (sender.view?.tag)!
        let imv = sender.view?.viewWithTag(1001) as! UIImageView
        indexSelectedSection = index
        
        UIView.animate(withDuration: 0.25, animations:{
            imv.transform = CGAffineTransform(rotationAngle: CGFloat( self.isCollapse ? 2 * Double.pi  : Double.pi / 2 ))
        })
        
        let countOfRowsToHandle = dataSource[index].count
        let indexPathToInsert: NSMutableArray = NSMutableArray()
        if isCollapse {
            
            isCollapse = false
            for i in 0..<countOfRowsToHandle {
                indexPathToInsert.add(IndexPath.init(row: i, section: index))
            }
            mainTable.insertRows(at: indexPathToInsert as! [IndexPath], with: .top)

        } else {
            
            isCollapse = true
            for i in 0..<countOfRowsToHandle {
                indexPathToInsert.add(IndexPath.init(row: i, section: index))
            }
            mainTable.deleteRows(at: indexPathToInsert as! [IndexPath], with: .top)
        }

    }
}

