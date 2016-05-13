//
//  Weather.swift
//  Weather
//
//  Created by Matt Deuschle on 5/12/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation
import SwiftyJSON

class Weather {

    var name = ""
    var temp = ""
    var descrip = ""

    init(json: JSON) {

        self.name = json["name"].stringValue
        self.temp = String(json["main"]["temp"].doubleValue)
        for item in json["weather"].arrayValue {
            self.descrip = item["description"].stringValue
        }
    }
}
