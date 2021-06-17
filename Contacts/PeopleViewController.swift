//
//  PeopleViewController.swift
//  Contacts
//
//  Created by Ronald Fornis Paglinawan on 17/06/21.
//

import UIKit

class PeopleViewController: UIViewController {
    
    /// IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    /// Class level variables and constants
    var nameArray = [String]()
    var emailArray = [String]()
    var mobileArray = [String]()
    var addressArray = [String]()
    var friendsArray1 = [String]()
    var friendsArray2 = [String]()
    var friendsArray3 = [String]()
    var totalContacts = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonData = readLocalJSONFile(forName: "people")
        
        if let data = jsonData {
            if let sampleRecordObj = parse(jsonData: data) {
                
                totalContacts = sampleRecordObj.people.count
                
                for item in 1...totalContacts {
                    nameArray.append(sampleRecordObj.people[item - 1].name)
                    emailArray.append(sampleRecordObj.people[item - 1].email)
                    mobileArray.append(sampleRecordObj.people[item - 1].mobile_number)
                    addressArray.append(sampleRecordObj.people[item - 1].address)
                    
                }
                
                friendsArray1.append(contentsOf: sampleRecordObj.people[0].friends)
                friendsArray2.append(contentsOf: sampleRecordObj.people[1].friends)
                friendsArray3.append(contentsOf: sampleRecordObj.people[2].friends)
            }
        }
    }
    
    func readLocalJSONFile(forName name: String) -> Data? {
        
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func parse(jsonData: Data) -> sampleRecord? {
        
        do {
            let decodedData = try JSONDecoder().decode(sampleRecord.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func getFriendsList(row: Int) -> [String] {
        
        switch row {
        case 0:
            return friendsArray1
        case 1:
            return friendsArray2
        case 2:
            return friendsArray3
        default:
            return [""]
        }
    }
}


// MARK: - UITableViewDataSource Protocols
extension PeopleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return totalContacts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as? peopleTableViewCell
        cell?.nameLabel.text = nameArray[indexPath.row]
        cell?.emailLabel.text = emailArray[indexPath.row]
        
        return cell!
    }
}

// MARK: - UITableViewDelegate Protocol
extension PeopleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.name = nameArray[indexPath.row]
        vc?.email = emailArray[indexPath.row]
        vc?.mobile = mobileArray[indexPath.row]
        vc?.address = addressArray[indexPath.row]
        vc?.friends = getFriendsList(row: indexPath.row)
        
        navigationController?.pushViewController(vc!, animated: true)
    }
}
