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
  var quantity: Int?
  var addSprinkles = false // set default value of addSprinkles to false
  //Make cost value private because we don't want anyone to reachout our cost value and change it
  fileprivate var cost: Double? = nil
  
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
