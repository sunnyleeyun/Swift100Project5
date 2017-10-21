//
//  Tip.swift
//  project5
//
//  Created by Mac on 2017/10/21.
//  Copyright © 2017年 Sunny, Lee. All rights reserved.
//

import Foundation

class Tip {
  func calculateTip(amount: Float, tip: Float) -> Float {
    return amount * tip
  }
  
  func calculateTotal(amount: Float, tip: Float) -> Float {
    return amount * (1 + tip)
  }
}
