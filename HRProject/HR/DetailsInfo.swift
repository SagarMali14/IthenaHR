//
//  DetailsInfo.swift
//  HRProject
//
//  Created by Gaurav on 13/05/22.
//  Copyright © 2022 Felix IT. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DetailsInfo: UIViewController {
    
    @IBOutlet weak var detailseOfEmployee: UITableView!
    
    var Employe: [Employee] = []
    var techNames = ""
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEmployee()
    }
    
    func fetchEmployee() {
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "technology == %@", techNames)
        do {
            Employe = try context.fetch(fetchRequest)
            print(Employe)
            detailseOfEmployee.reloadData()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

extension DetailsInfo: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Employe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1") as! EmployeeInformationTableViewCell
        let  employee = self.Employe[indexPath.row]
        cell1.firstNameTxtLbl.text = employee.firstName
        cell1.lastNameTxtLbl.text = employee.lastName
        cell1.emailTxtLbl.text = employee.emailId
        cell1.phoneTxtLbl.text = employee.phoneNo
        return cell1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
