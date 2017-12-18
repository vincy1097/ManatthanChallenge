//
//  Activities.swift
//  Manhattan Challenge
//vincenzo
//  Created by Michele De Sena on 13/12/2017.
//  Copyright © 2017 Michele De Sena. All rights reserved.
//

import Foundation
class Activities{
    static let shared = Activities()
    
    var activities:[Activity]?
    
    func getActivities()->[Activity]{
        
        if let activities = self.activities{
            return activities
        }else{
            return []
        }
        
    }
    
    
    func addActivity(activity:Activity){
        self.activities?.append(activity)
    }
}
