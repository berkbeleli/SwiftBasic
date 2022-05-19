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
  
}
