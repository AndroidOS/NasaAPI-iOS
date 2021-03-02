//
//  WeatherModel.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 3/3/21.
//

import Foundation

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
    @JsonProperty("First_UTC")
    let Date first_UTC;
    @JsonProperty("Last_UTC")
    let Date last_UTC;
    @JsonProperty("Month_ordinal")
    let Int month_ordinal;
    @JsonProperty("Northern_season")
    let String northern_season;
    @JsonProperty("PRE")
    let PRE pRE;
    @JsonProperty("Season")
    let String season;
    @JsonProperty("Southern_season")
    let String southern_season;
    @JsonProperty("WD")
    let WD wD;
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

