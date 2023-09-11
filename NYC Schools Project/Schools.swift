//
//  Schools.swift
//  NYC Schools Project
//
//  Created by Jaleel Gilbert on 9/5/23.
//

import Foundation



struct Schools: Codable {
       let dbn, schoolName, primaryAddressLine1, city, stateCode,
           totalStudents, zip, latitude, phoneNumber, website: String
       let graduationRate: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case city
        case zip
        case latitude
        case website
        case graduationRate = "graduation_rate"
        case primaryAddressLine1 = "primary_address_line_1"
        case stateCode = "state_code"
        case schoolName = "school_name"
        case totalStudents = "total_students"
        case phoneNumber = "phone_number"
      
    }
    
}


struct SchoolSATScores: Codable {
    let dbn, schoolName, numOfSatTestTakers, satCriticalReadingAvgScore: String
    let satMathAvgScore, satWritingAvgScore: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
}



enum APIError: Error {
    case invalidURL
    case invalidHTTPResponse
    case badRequest400
    case notAuthorized401
    case forbidden403
    case notFound404
    case internalServerError500
}
