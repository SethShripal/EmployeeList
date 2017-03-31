//
//  ViewController.swift
//  EmployeeList
//
//  Created by Shripal Jain on 30/03/17.
//  Copyright © 2017 Shripal Jain. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var emps:[Employee] = []
    var index:Int!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getData(){
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        do{
            
            let request: NSFetchRequest<Employee> = Employee.fetchRequest()
            let sectionSortDescriptor = NSSortDescriptor(key: "designation", ascending: true)
            let sortDescriptors = [sectionSortDescriptor]
            request.sortDescriptors = sortDescriptors
            
            emps = try context.fetch(request)
            
        }
        catch{
            print("Fetching Failed")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmpTableViewCell
        let emp = emps[indexPath.row]
        
        if let myname = emp.name, let imag = emp.photo, let des = emp.designation{
            cell.name.setTitle("Name: "+des, for: .normal)
            cell.desg.setTitle("Designation: "+myname, for: .normal)
            cell.profilepic.setImage(UIImage(data: (imag as NSData) as Data), for: .normal)
            if (myname.caseInsensitiveCompare("developer") == ComparisonResult.orderedSame){
                cell.contentView.backgroundColor = UIColor.lightGray
            }
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emps.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "movetoprofie" , sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="movetoprofie"){
        let profilevc = segue.destination as! ProfileViewController
        profilevc.desg = self.emps[index].designation
        profilevc.name = self.emps[index].name
        let imag = self.emps[index].photo
        profilevc.photo = UIImage(data:imag as! Data,scale:1.0)}
}
        
    
}

