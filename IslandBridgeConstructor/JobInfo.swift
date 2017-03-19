//
//  ConstructionInfo.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/19/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

class JobInfo {
    
    private(set) var jobType: JobType
    private(set) var jobDate: Int
    
    var description: String {
        get {
            return jobType.jobDetail
        }
    }
    
    init(from:Island, to:Island, type:JobType, date:Int) {
        jobType = type
        jobDate = date
    }
    
}
