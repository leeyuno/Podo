//
//  String+Extension.swift
//  Podo
//
//  Created by 이윤오 on 2022/09/16.
//

import Foundation

extension String {
    func chomp(_ trailing: String = " ") -> String {
        guard hasSuffix(trailing) else { return self }
        let substring = prefix(count - trailing.count)
        return String(substring).chomp(trailing)
    }
}
