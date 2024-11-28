class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        var newMatrix: [[Int]] = []
        for i in 0..<matrix[0].count { 
            var newRow: [Int] = []
            for j in 0..<matrix.count {
                newRow.append(matrix[j][i])
            }
            newMatrix.append(newRow.reversed())
        }
        
        for (i, _) in matrix.enumerated() { 
            matrix[i] = newMatrix[i]
        }
    }
}