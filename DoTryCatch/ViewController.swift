//
//  ViewController.swift
//  DoTryCatch
//
//  Created by Xiaodan Wang on 4/24/18.
//  Copyright © 2018 Xiaodan Wang. All rights reserved.
//

import UIKit

protocol FindNameProtocol: class {
    func findName_(by id: Int) -> String
    func findName__(by id: Int) -> String?
    func findName___(by id: Int) throws -> String
    func findName____(by id: Int) throws -> String
}

class ViewController: UIViewController, FindNameProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name1 = findName_(by: 00)
        if !name1.isEmpty {
            print(name1)
        }
        
        if let name2 = findName__(by: 1) {
            print(name2)
        }
        
        do {
            let name3 = try findName___(by: 1)
            print(name3)
        } catch {
            print(error.localizedDescription)
        }
        
        if let name3 = try? findName___(by: 1) {
            print(name3)
        }
        
        do {
            let name4 = try findName____(by: 2)
            print(name4)
        } catch NameFindingException.floorException {
            
        } catch NameFindingException.ceilingException {
            
        } catch NameFindingException.invalidException {
            
        } catch {
            
        }
        
        if let name4 = try? findName____(by: 88) {
            print(name4)
        }
        
        
        
    }
    
    // 1. returning solid String
    func findName_(by id: Int) -> String {
        switch id {
        case 1:
            return "Sheldon"
        default:
            return ""
        }
    }
    
    // 2. returning optional String
    func findName__(by id: Int) -> String? {
        switch id {
        case 1:
            return "Sheldon"
        default:
            return nil
        }
    }
    
    // 3. returning + throwing raw NSError
    func findName___(by id: Int) throws -> String {
        switch id {
        case 1:
            return "Sheldon"
        default:
            throw NSError(domain: "invalid id", code: 0, userInfo: nil)
        }
    }
    
    // 4. returning + throwing custom Error
    func findName____(by id: Int) throws -> String {
        switch id {
        case 1:
            return "Sheldon"
        case ...0:
            throw NameFindingException.floorException
        case 100...:
            throw NameFindingException.ceilingException
        default:
            throw NameFindingException.invalidException
        }
    }

}

enum NameFindingException: Error {
    case floorException
    case ceilingException
    case invalidException
}
