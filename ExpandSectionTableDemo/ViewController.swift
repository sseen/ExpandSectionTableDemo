//
//  ViewController.swift
//  ExpandSectionTableDemo
//
//  Created by sseen on 2017/4/7.
//  Copyright © 2017年 sseen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
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
    
        view.backgroundColor = UIColor.cyan
        lbl.text = "hel"
        lbl.textColor = UIColor.black
        imv.frame = CGRect(x: 70, y: 5, width: 30, height: 30)
        
        view.addSubview(lbl)
        view.addSubview(imv)
        
        
        
        return view
    }
}

