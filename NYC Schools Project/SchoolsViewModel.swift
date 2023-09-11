//
//  SchoolsViewModel.swift
//  NYC Schools Project
//
//  Created by Jaleel Gilbert on 9/5/23.
//

import Foundation
import UIKit


class SchoolsViewModel: ObservableObject {
    
    @Published var schoolsData = [SchoolSATScores]()
    
    @Published var schools = [Schools]()
    
    @MainActor
    func getSchools(pageNumber: Int, completion: @escaping (Bool) -> ()) async {
        do {
            let data = try await SchoolsNetworking.shared.getAllSchools(number: pageNumber)
            self.schools = data
            completion(true)
        } catch {
            print(error)
            completion(false)
        }
    }
    
    
    @MainActor
    func getSchoolSATData(dbnId: String, completion: @escaping (Bool) -> ()) async {
       
        do {
            let data = try await SchoolsNetworking.shared.getSchoolData(schoolDBN: dbnId)
            self.schoolsData = data
            completion(true)
        } catch {
            completion(false)
            print(error)
        }
        
    }
    
    
}
