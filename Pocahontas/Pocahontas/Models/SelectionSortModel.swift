//
//  SelectionSortModel.swift
//  Pocahontas
//
//  Created by Alina Zaitseva on 5/8/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

class SelectionSortModel: SortMethodsProtocol {
    var count: Int {
        get {
            return arrayForSort.count
        }
    }
    var arrayForSort = [2,234,34,-4,6,12,9,11,61]
    private var lastItem = 0
    
    func getSortAlgorithm() -> (at: Int, to: Int, isFinishAction: Bool) {
        for i in lastItem..<arrayForSort.count-1 {
            lastItem = i
            var minElement = i
            for j in i+1..<arrayForSort.count {
                if arrayForSort[j] < arrayForSort[minElement] {
                    minElement = j
                }
            }
            if i != minElement {
                arrayForSort.swapAt(i, minElement)
                return (at: i, to: minElement, isFinishAction: false)
            }
        }
        return (at: 0, to: 0, isFinishAction: true)
    }
}

