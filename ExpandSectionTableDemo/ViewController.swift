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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect.zero)
        
        // align view from the left
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[view]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": view]));
        
        // align view from the top
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[view]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": view]));
        
        // width constraint
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[view(==100)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": view]));
        
        // height constraint
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[view(==20)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": view]));
    }
}

