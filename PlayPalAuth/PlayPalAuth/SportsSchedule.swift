//
//  SportsSchedule.swift
//  PlayPalAuth
//
//  Created by vijay_tadimeti on 1/29/19.
//  Copyright © 2019 vijay_tadimeti. All rights reserved.
//

import UIKit

class SportsSchedule: UIViewController {
//outlets
    let sportslist:NSArray = ["Raquetball", "Squash", "Badminton", "Basketball", "Table Tennis"]
    let myTeXtField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
//connstants
    
//variables
    let multiplePicker = MultiplePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupTextField()
        setupMultiplePicker()

        // Do any additional setup after loading the view.
    }
    func setupTextField(){
        view.addSubview(myTeXtField)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1]-(<=1)-[v0(45)]", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: ["v0":myTeXtField, "v1":self.view]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v1]-(<=1)-[v0(300)]", options: NSLayoutConstraint.FormatOptions.alignAllCenterY    , metrics: nil, views: ["v0":myTeXtField, "v1":self.view]))
        
        
    }
    
    func setupMultiplePicker(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title:"Done", style: .plain, target: self, action: #selector(donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title:"Cancel", style: .plain, target: self, action: #selector(cancelPicker))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        myTeXtField.inputAccessoryView = toolBar
        multiplePicker.menuOptions = sportslist as! [String]
        multiplePicker.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        myTeXtField.inputView = multiplePicker
        
    }

    @objc func donePicker(){
        myTeXtField.text  = multiplePicker.str
        myTeXtField.resignFirstResponder()
        
    }
    
    @objc func cancelPicker(){
        myTeXtField.resignFirstResponder()
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

class MultiplePicker:UIView, UITableViewDelegate, UITableViewDataSource{
    
    var menuOptions:[String]! = []
    var pickedArr:[String]! = []
    var str:String! = ""
    var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupTableView()
    }
    func setupTableView(){
        self.addSubview(tableView)
        tableView.backgroundColor = .lightGray
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        cell.textLabel?.text = menuOptions[indexPath.item]
        cell.backgroundColor = .darkGray
        cell.selectionStyle = .none
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         var i = indexPath.item
         let cell = tableView.cellForRow(at: indexPath)
        
         if !pickedArr.contains(menuOptions[i]){
                cell?.backgroundColor = .white
                pickedArr.append(menuOptions[i])
         }
         else{
                cell?.backgroundColor = .clear
                let index = pickedArr.index(of:menuOptions[i])
                pickedArr.remove(at:index!)
            }
            
            str = pickedArr.joined(separator: ",")
    }

required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
}



