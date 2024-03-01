//
//  DBHelper.swift
//  Registration Page
//
//  Created by R95 on 01/03/24.
//

import Foundation
import SQLite3
import UIKit

struct UserData {
    var email: String
    var password: String
}

class DBHelper {
    static var file : OpaquePointer?
    static var userArray = [UserData]()
    
    static func createFile() {
        var a = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        a.appendPathComponent("My User Data.db")
        sqlite3_open(a.path, &file)
        print("Creat A File")
        print(a.path)
        creatTable()
    }
    
    
    static func creatTable() {
        let quary = "Create Table if not exists User (email text,password text)"
        var table: OpaquePointer?
        sqlite3_prepare(file, quary, -1, &table, nil)
        sqlite3_step(table)
        print("Create Table")
    }
    
    static func addData(email: String, password: String) {
        let quary = "insert into user values ('\(email)', '\(password)')"
        var add: OpaquePointer?
        sqlite3_prepare(file, quary, -1, &add, nil)
        sqlite3_step(add)
        print("add data")
    }
    
    static func getData() {
        let quary = "SELECT * FROM User"
        var read: OpaquePointer?
        sqlite3_prepare(file, quary, -1, &read, nil)
        
        while sqlite3_step(read) == SQLITE_ROW {
                if let email = sqlite3_column_text(read, 0),
                   let password = sqlite3_column_text(read, 1) {
                    let userEmail = String(cString: email)
                    let userPassword = String(cString: password)
                    let userData = UserData(email: userEmail, password: userPassword)
                    userArray.append(userData)
                    print("Email: \(userEmail), Password: \(userPassword)")
                }
            }
    }
    
}
