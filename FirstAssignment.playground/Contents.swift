//
//  FirstAssignment.playground
//
//  Created by Berk Beleli on 17-05-2022
//

import UIKit

//
// Struct Example
//

// MARK: - Definition of CupcakeOrder struct
struct CupcakeOrder{
  static let cakeTypes = ["Vanilla", "Strawberry", "Chocolate", "Rainbow", "Hazelnut"]
  var type: Int
  private var quantity: Int?
  var addSprinkles: Bool // set default value of addSprinkles to false
  //Make cost value private because we don't want anyone to reachout our cost value and change it
  private var cost: Double? = nil
  
  init(type: Int, quantity: Int? = nil, addSprinkles: Bool = false){
    self.type = type
    self.quantity = quantity
    self.addSprinkles = addSprinkles
  }
  
  /// <#Description#>
  /// This function calculates the value of cost for the given order according to the choices
  ///
  ///  ```
  /// var firstOrder = CupcakeOrder(type: 1, quantity: 4, addSprinkles: false)
  /// firstOrder.calculateCost()
  /// ```
  ///
  mutating func calculateCost(){ // make our function mutating as we change self struct variable inside
    guard let quantity = quantity else {
      self.cost = 0
      return
    }
    
    self.cost = Double(quantity) * 2
    self.cost! += (Double(type) / 2)
    //0.50$ for sprinkles
    if addSprinkles{
      self.cost! += Double(quantity) / 2
    }
  }
  
  /// <#Description#>
  /// This function gives the summary of the choices and cost of the value
  ///
  /// ```
  /// var firstOrder = CupcakeOrder(type: 1, quantity: 4, addSprinkles: false)
  /// print(firstOrder.displayOrderSummary())
  /// ```
  ///
  /// - Warning: The returned string is not localized. before this function do not forget the call calculateCost function!
  /// - Returns: A summary string
  func displayOrderSummary() -> String{
    //Check if quantity has valid value or not
    guard let quantity = quantity else {
      return "Unvalid quantity"
    }
    //Check if cost has valid value or not
    guard let cost = cost else {
      return "Unvalid cost"
    }
    
    if quantity <= 0 { //  this line of code checks if quantity set to zero or minus value
      return "Add some cupcake to your cart"
    }else if self.type > CupcakeOrder.cakeTypes.count{ // this line ckecks if type value is valid
      return "Invalid Cupcake Type"
    }else if cost > 0{ // if the 2 if statement passed and its cost calculated it will summarize order and return multiline string
      return """
       You ordered cupcake with \(CupcakeOrder.cakeTypes[self.type])
       amount of \(self.quantity ?? 0)
       \(self.addSprinkles ? "with Sprinkles" : "without Sprinkles")
       and costs $\(cost)
       """
    }else{ // if none of the upper if statement validated this linewe will work
      return "Something went wrong try again"
    }
  }
}

var orders: [CupcakeOrder] = [] // create an array of CupcakeOrder to keep our all orders
// create instances of CupcakeOrder struct and append them to our array
orders.append(CupcakeOrder(type: 2, quantity: 5, addSprinkles: true))
orders.append(CupcakeOrder(type: 1, quantity: 2, addSprinkles: false))
orders.append(CupcakeOrder(type: 7, quantity: 6, addSprinkles: true))
orders.sort{ $0.type < $1.type } // sort our orders array according to their type

// We calculated every single element's cost in our array via looping over them
for index in 0..<orders.count{
  orders[index].calculateCost()
}

// We displayed our order summary via looping over them
orders.forEach{
  print($0.displayOrderSummary())
}

print(orders.count) // printed number of elements in our array
orders.removeAll() // removed all items in our array
print(orders.count) // printed number of elements in our array

//
// Class Example
//
// MARK: - Definition of NewsCategory enum
enum NewsCategory{
  case foreignNews, education, economy, magazine, politic, sport
}
// MARK: - Definition of News class
class News{
  //Definition of variables
  private var title: String
  var description: String
  private var category: NewsCategory // category will be type of NewsCategory enum
  var author: String?
  var pubDate: String
  var imageUrl: String
  // definition of default initializers
  init(title: String, description: String, category: NewsCategory, author: String? = "Unknown", pubDate: String, imageUrl: String ){
    self.title = title
    self.description = description
    self.category = category
    self.author = author
    self.pubDate = pubDate
    self.imageUrl = imageUrl
  }
  // this initializers let us create an instance with just title value
  convenience init(_ title:String) {
    self.init(title: title, description: "Unknown", category: .education, pubDate: "15 Jun 2000", imageUrl: "https://default.jpg") // call the defult init
  }
  
  /// <#Description#>
  /// This function gives the Category Type according to choice
  ///
  /// ```
  /// var firstNew = News(title: "Gulf’s Smallest Oil Producer ")
  /// print(firstNew.getCategoryType()) // Education News
  /// ```
  ///
  /// - Warning: The returned string is not localized
  /// - Returns: A summary string
  func getCategoryType() -> String{
    switch category{
    case .foreignNews:
      return "Foreign News"
    case .education:
      return "Education News"
    case .economy:
      return "Foreign News"
    case .magazine:
      return "Magazine News"
    case .politic:
      return "Politic News"
    case .sport:
      return "Sport News"
    }
  }
  
  // As we set the title variable private we need a function to set its value
  func setNewsTitle(_ title: String){ self.title = title }
  // As we set the title of the new private we need a function to get its value
  func getNewsTitle() -> String{ title }
  
  // As we set the title variable private we need a function to set its value
  func setCategory(_ category: NewsCategory){ self.category = category }
}

var allNews: [News] = []  // create an array of News to keep our all news
// Created an instance of News class with default initializer
var foreignNew = News(
  title: "Gulf’s Smallest Oil Producer ",
  description: "Middle Eastern state reviewing energy assets for sales",
  category: .economy,
  author: "Anthony Di Paola",
  pubDate: "16 May 2022",
  imageUrl: "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/i9JATJWbN98I/v0/560x420.jpg")
allNews.append(foreignNew) // Add our instance of News class to our created allNews array
// Created another instance of News class with convenience init (we just give title and rest is set through convenience init)
var defaultNew = News("Default New Type")
allNews.append(defaultNew)
allNews.forEach { print($0.getCategoryType()) }

/* The next 10 lines of code demonstrate the main difference between struct and class we create an
 copy of our foreignNew instance but as we set title of created new instance the title of our
 foreignNew will change as well cause in class we pass by reference but in struct pass by value */
var anotherNew = foreignNew // "Class" pass by reference
foreignNew.getNewsTitle()
anotherNew.setNewsTitle("Foreign New")
foreignNew.getNewsTitle() // as we can see our title changed as well

var chocolateOrder = CupcakeOrder(type: 2, quantity: 5, addSprinkles: true)
var anotherOrder = chocolateOrder // "Struct" pass by value
print(CupcakeOrder.cakeTypes[chocolateOrder.type]) // our old type of cake
anotherOrder.type = 3
print(CupcakeOrder.cakeTypes[chocolateOrder.type]) // as we can see our type is same
