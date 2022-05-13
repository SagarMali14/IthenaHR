//
//  TechList.swift
//  HRProject
//
//  Created by Felix IT on 12/05/22.
//  Copyright © 2022 Felix IT. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TechList: UIViewController {
    
    @IBOutlet weak var techList: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func regEmployee(techName: String) -> Int {
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "technology == %@", techName)
        do {
            let employees = try context.fetch(fetchRequest)
            return employees.count
        } catch let error {
            print(error.localizedDescription)
        }
        return 0
    }
}

extension TechList: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Technologies.techListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = Technologies.techListArray[indexPath.row]
        cell?.detailTextLabel?.text = "\(regEmployee(techName: Technologies.techListArray[indexPath.row]))"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsInfo") as? DetailsInfo
        vc!.techNames = Technologies.techListArray[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
