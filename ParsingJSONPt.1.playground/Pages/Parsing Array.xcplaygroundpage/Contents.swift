//PARSING ARRAY

import Foundation

let json = """

 [
     {
         "title": "New York",
         "location_type": "City",
         "woeid": 2459115,
         "latt_long": "40.71455,-74.007118"
     }
 ]
""".data(using: .utf8)!


// ++++++++++++++++++++++++++++++++++++++++++++++++++++
// create model
// ++++++++++++++++++++++++++++++++++++++++++++++++++++

struct City: Codable {
    let title: String
    let locationType: String
    let woeid: Int
    let coordinate: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case locationType = "location_type"
        case woeid
        case coordinate = "latt_long"
    }
}

do {
    let weatherArray = try
        JSONDecoder().decode([City].self, from: json)
    dump(weatherArray)
} catch {
    print("decoding error: \(error)")
}

/*
 ▿ 1 element
 ▿ __lldb_expr_1.City
   - title: "New York"
   - locationType: "City"
   - woeid: 2459115
   - coordinate: "40.71455,-74.007118"

 */
