class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    //topological sort로 구현해야 함
        var adjList: [Int: [Int]] = [:]
        var inOrder: [Int: Int] = [:]
        for prerequisite in prerequisites {
            let k = prerequisite[0]
            let v = prerequisite[1]
            adjList[v, default: []].append(k)
            inOrder[k, default: 0] += 1
            inOrder[v, default: 0] += 0
        }
        
        while !inOrder.isEmpty {
            var isFound = false
            for (key, value) in inOrder{
                if value == 0 {
                    isFound  = true
                }
            }
            if !isFound {
                return false
            }
            
            for (key, value) in inOrder {
                if value != 0 {continue}
                inOrder.removeValue(forKey: key)
                
                for neighbor in adjList[key, default:  []] {
                    if inOrder[neighbor] != nil {
                        inOrder[neighbor]! -= 1
                    }
                }
            }
        }
        return true

    }
}