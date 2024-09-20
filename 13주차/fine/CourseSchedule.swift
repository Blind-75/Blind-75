class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = [Int: [Int]]()
        
        // 그래프 생성
        for prereq in prerequisites {
            let course = prereq[0]
            let prerequisite = prereq[1]
            graph[course, default: []].append(prerequisite)
        }
        
        var visited = [Int: Bool]()
        
        // DFS 함수 정의
        func dfs(_ course: Int) -> Bool {
            if visited[course] == true { return false }
            if visited[course] == false { return true }
            
            visited[course] = true
            
            if let prerequisites = graph[course] {
                for prereq in prerequisites {
                    if !dfs(prereq) { return false }
                }
            }
            
            visited[course] = false
            return true
        }
        
        // 모든 코스에 대해 DFS 실행
        for course in 0..<numCourses {
            if !dfs(course) { return false }
        }
        
        return true
    }
}            