class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var masterList = [Int: [Int]]()

        var visited = Set<Int>()

        for prereq in prerequisites {
            if var course = masterList[prereq[0]] {
                course.append(prereq[1])
                masterList[prereq[0]] = course
            } else {
                masterList[prereq[0]] = [prereq[1]]
            }
        } 

        func dfs(course: Int) -> Bool {
            if visited.contains(course) { return false }
            guard let preCourse = masterList[course] else { return true }
            visited.insert(course)

            for child in preCourse {
                if !dfs(course: child) { return false }
            }
            visited.remove(course)
            masterList[course] = [] // to account for all the nodes that have already been visited
            return true
        }

        for crs in 0..<numCourses {
            if !dfs(course: crs) { return false }
        }
        return true
    }
}