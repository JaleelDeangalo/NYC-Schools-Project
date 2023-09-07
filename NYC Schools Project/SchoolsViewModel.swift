//
//  SchoolsViewModel.swift
//  NYC Schools Project
//
//  Created by Jaleel Gilbert on 9/5/23.
//

import Foundation
import UIKit


class SchoolsViewModel: ObservableObject {
    
    lazy var schoolsData = [Schools]()
    
    
    @MainActor
    func getData(completion: @escaping (Bool) -> ()) async {
       
        do {
            let data = try await SchoolsNetworking.shared.getSchoolData()
            self.schoolsData = data
            completion(true)
        } catch {
            completion(false)
            print(error)
        }
        
    }

    
    
}
