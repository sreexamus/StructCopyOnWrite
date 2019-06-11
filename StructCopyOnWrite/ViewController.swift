//
//  ViewController.swift
//  StructCopyOnWrite
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/26/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        strucCopyOnWrite()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func strucCopyOnWrite() {
        
        var jamie = Person(details: Person.Details(address: "CA"), name: "jamie")
        var jamie1 = jamie
        
        print("addres of jamie \(address(o: &jamie1))")
        print("addres of jamie1 \(address(o: &jamie))")
        jamie1.details = Person.Details(address: "CA")
        
        print("addres of jamie1 \(address(o: &jamie1))")

    }

    func address(o: UnsafePointer<Void>) -> Int {
        return unsafeBitCast(o, to: Int.self)
    }
    
    func addressHeap<T: AnyObject>(o: T) -> Int {
        return unsafeBitCast(o, to: Int.self)
    }
}

struct Person: Equatable {
    struct Details: Equatable {
        var address: String
    }
    var details: Details
    var name: String
}



