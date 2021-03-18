//
//  WeatherModel.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 3/3/21.
//

import Foundation

struct DayReport{
    let av:Double
    let mx:Double
    let mn:Double
    let ct:Int
}

/* ObjectMapper om = new ObjectMapper(); struct Camera: Decodable 
Root root = om.readValue(myJsonString), Root.class); */
struct PRE{
    let av:Double
    let ct:Int
    let mn:Double
    let mx:Double
    let sol_hours_with_data:[Int]
    let valid:Bool
}

struct WD{
    let most_common:Any
}

struct _804{
    let first_UTC:String
    let last_UTC:String
    let month_ordinal:Int
    let northern_season:String
    let pRE:PRE
    let season:String
    let southern_season:String
    let wD:WD
}

struct _802{
    let pre:PRE
}

struct _803{
    let pre:PRE
}

struct _805{
    let pre:PRE
}

struct ValidityChecks{
    let _802:_802
    let _803:_803
    
    let _804: _804
    
    let _805:_805
    let sol_hours_required:Int
    let sols_checked:[String]
}

struct RootWeather{
    let _804:_804
    let sol_keys:[String]
    let validityChecks:ValidityChecks
}

