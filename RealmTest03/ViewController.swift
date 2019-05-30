//
//  ViewController.swift
//  RealmTest03
//
//  Created by dit02 on 2019. 5. 30..
//  Copyright © 2019년 dit02. All rights reserved.
//

import UIKit
import RealmSwift

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var ageLabel: UITextField!

    var personArray : Results<Person>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func addObject(_ sender: Any) {
        // DB에 객체 생성
        let newPerson = Person()
     //   newPerson.name = "박재홍"
     //   newPerson.age = 23
       
        newPerson.name = nameLabel.text!
        newPerson.age = Int(ageLabel.text!)!
        
        // DB에 객체 저장
        let realm = try!Realm()
        try! realm.write {
            realm.add(newPerson)
        }
        personArray = realm.objects(Person.self)
       
        
        nameLabel.text = ""
        ageLabel.text = ""
        
    }
    @IBAction func deleteObject(_ sender: Any) {
        let realm = try!Realm()
        try! realm.write {
            realm.deleteAll()
        }
        
    }
    
    @IBAction func getObject(_ sender: Any) {
       
        print(personArray!.count)
        print(personArray!)

    }
    
}

