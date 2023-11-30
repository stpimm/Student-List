//
//  StudentViewController.swift
//  Student List
//
//  Created by Immanuel Sitepu on 30/11/23.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var studentIDLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
}

class StudentListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var students: [Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        if let path = Bundle.main.path(forResource: "student", ofType: "json"),
           let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            parseJSON(data: jsonData)
        }

        tableView.dataSource = self
        tableView.delegate = self

    }

    func parseJSON(data: Data) {
        do {
            let decoder = JSONDecoder()
            students = try decoder.decode([Student].self, from: data)
            print("Number of students: \(students.count)")
        } catch {
            print("Error parsing JSON: \(error)")
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentTableViewCell

        let student = students[indexPath.row]
        cell.studentIDLabel.text = "NIM: \(student.studentID)"
        cell.nameLabel.text = student.name
        cell.addressLabel.text = student.address

  
        if let url = URL(string: student.profileImgURL) {
            cell.profileImageView.load(url: url)
        }

        return cell
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
