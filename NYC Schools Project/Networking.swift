//
//  Networking.swift
//  NYC Schools Project
//
//  Created by Jaleel Gilbert on 9/5/23.
//

import Foundation
import UIKit


// School names only https://data.cityofnewyork.us/resource/s3k6-pzi2.json

class SchoolsNetworking: NSObject {
    
    static let shared = SchoolsNetworking()
    
    private let limit = 30
    
    private override init() {}
    
    func getAllSchools(number: Int) async throws -> [Schools] {
        let offSet = number * limit
        
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$limit=\(limit)&$offset=\(offSet)") else { throw APIError.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("aaplication/json", forHTTPHeaderField: "Content-Type")
        
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else { throw APIError.invalidHTTPResponse }
        
        if response.statusCode > 299 {
            print(response.statusCode)
            throw APIError.invalidHTTPResponse
        }
        
        
        return try JSONDecoder().decode([Schools].self, from: data)
        
    }
    
    
    func getSchoolData(schoolDBN: String) async throws -> [SchoolSATScores] {
        
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(schoolDBN)") else { throw APIError.invalidURL }
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else { throw APIError.invalidHTTPResponse }
        
        if response.statusCode > 299 {
            print(response.statusCode)
            throw APIError.invalidHTTPResponse
        }
        
        return try JSONDecoder().decode([SchoolSATScores].self, from: data)
        
    }
    

    
}
