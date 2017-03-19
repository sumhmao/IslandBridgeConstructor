//
//  ArrayExtension.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/19/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

extension Array where Element: AnyObject {
    
    mutating func removeObject(_ object:Element) {
        if let index = self.index(where: { $0 === object }) {
            self.remove(at: index)
        }
    }
    
    mutating func removeObjects(_ objects:[Element]) {
        objects.forEach { object in
            self.removeObject(object)
        }
    }
    
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
    
    func randomItemWithException(_ exception:[Element]) -> Element {
        var targetGroup = [Element](self)
        targetGroup.removeObjects(exception)
        return targetGroup.randomItem()
    }
    
}
