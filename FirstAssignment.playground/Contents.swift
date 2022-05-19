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
  

  
}
