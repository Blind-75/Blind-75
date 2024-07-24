class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        return Array(s).sorted() == Array(t).sorted()
    }
}