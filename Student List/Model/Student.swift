//
//  Student.swift
//  Student List
//
//  Created by Immanuel Sitepu on 30/11/23.
//

import Foundation

struct Student: Decodable {
    let studentID: String
    let name: String
    let address: String
    let profileImgURL: String

    enum CodingKeys: String, CodingKey {
        case studentID = "StudentID"
        case name = "Name"
        case address = "Address"
        case profileImgURL = "ProfileImg"
    }
}
