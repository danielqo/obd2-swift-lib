//
//  ScanToolResponse.swift
//  OBD2Swift
//
//  Created by Max Vitruk on 26/04/2017.
//  Copyright © 2017 Lemberg. All rights reserved.
//

import Foundation
import CoreLocation

func MORE_PIDS_SUPPORTED(_ data : [UInt8]) -> Bool {
  guard data.count > 3 else {return false}
  return ((data[3] & 1) != 0)
}

func NOT_SEARCH_PID(_ pid : Int) -> Bool {
  return (pid != 0x00 && pid != 0x20 &&
    pid != 0x40 && pid != 0x60 &&
    pid != 0x80 && pid != 0xA0 &&
    pid != 0xC0 && pid != 0xE0)
}

struct SupportedPIDMap {
  // DATA A
  var pid07 : Int = 1
  var pid06 : Int = 1
  var pid05 : Int = 1
  var pid04 : Int = 1
  var pid03 : Int = 1
  var pid02 : Int = 1
  var pid01 : Int = 1
  var pid00 : Int = 1
  
  // DATA B
  var pid0F : Int = 1
  var pid0E : Int = 1
  var pid0D : Int = 1
  var pid0C : Int = 1
  var pid0B : Int = 1
  var pid0A : Int = 1
  var pid09 : Int = 1
  var pid08 : Int = 1
  
  // DATA C
  var pid17 : Int = 1
  var pid16 : Int = 1
  var pid15 : Int = 1
  var pid14 : Int = 1
  var pid13 : Int = 1
  var pid12 : Int = 1
  var pid11 : Int = 1
  var pid10 : Int = 1

  // DATA D
  var pid1F : Int = 1
  var pid1E : Int = 1
  var pid1D : Int = 1
  var pid1C : Int = 1
  var pid1B : Int = 1
  var pid1A : Int = 1
  var pid19 : Int = 1
  var pid18 : Int = 1
}

class ScanToolResponse {
  var scanToolName = ""
  var `protocol` = ScanToolProtocol.none
  
  var responseData : Data?
  var responseString = ""
  var isError = false
  var timestamp : Date
  
  var priority : UInt8 = 0x00
  var targetAddress : UInt8 = 0x00
  var ecuAddress : UInt8 = 0x00
  var data : Data?
  var mode : UInt8 = 0x00
  var pid : UInt8 = 0x00
  var crc : UInt8 = 0x00
  
  init() {
    timestamp = Date()
  }
  
  func rawData() -> Data? {
    return responseData
  }
  
  func setRawData(data : Data) {
    responseData = data
  }
}

