//
//  Array+Extension.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

public extension Array {

    /// Returns value from given index. If out of bounds, return empty array subsequence
    subscript (safe range: ClosedRange<Int>) -> Array<Element>.SubSequence {
        guard !self.isEmpty && range.lowerBound < count else { return [] }
        let safeMinRange = Swift.max(0, range.lowerBound)
        let safeMaxRange = Swift.min(range.upperBound, count - 1)
        return self[safeMinRange...safeMaxRange]
    }
}
