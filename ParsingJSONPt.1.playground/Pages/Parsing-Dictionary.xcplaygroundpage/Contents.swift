// Parsing Dictionary
import Foundation

let json = """
{
 "results": [
   {
     "firstName": "John",
     "lastName": "Appleseed"
   },
  {
    "firstName": "Alex",
    "lastName": "Paul"
  }
 ]
}
""".data(using: .utf8)!

// ++++++++++++++++++++++++++++++++++++++++++++++++++++
// create model
// ++++++++++++++++++++++++++++++++++++++++++++++++++++

// Codable - is an alias that has Codable and Decodable in it
// Decodable - converts the json data
// Encodable - converts json data to e.g POST to a Web API

// Top level is a dicitonary
struct ResultsWrapper: Decodable {
    let results: [Contact]
}

struct Contact: Decodable {
    let firstName: String
    let lastName: String
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++
// decode the JSON to our Swift model
// ++++++++++++++++++++++++++++++++++++++++++++++++++++


// it could throw an error
// you would start with the top level json
do {
    let dictionary = try JSONDecoder().decode(ResultsWrapper.self, from: json)
    let contacts = dictionary.results // [Contacts]
    dump(contacts)
} catch {
    print("this is a decoding error: \(error)")
}

