// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
class FinalObject: Codable {
    var id: Int?
    var name: String?
    var materialID, objectToReusesID: Int?
    var img, linkVideo, tools, explain: String?
    var skill: String?
}
/*
struct FinalObjects: Codable {
  

    enum CodingKeys: String, CodingKey {
        case id, name
        case materialID = "material_id"
        case img
        }
    }
*/

