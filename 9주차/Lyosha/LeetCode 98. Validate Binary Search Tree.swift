/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    var mystack: [Int] = []

    func inOrderTraverse(_ root: TreeNode) -> Void { 
        if root.left == nil && root.right == nil { 
            self.mystack.append(root.val)
        }

        else { 
            if let rootLeft = root.left { 
                self.inOrderTraverse(rootLeft)
            }
            self.mystack.append(root.val)
            if let rootRight = root.right { 
                self.inOrderTraverse(rootRight)
            }
        }
    }

    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        self.inOrderTraverse(root)

        var curr = Int.min
        for (i, num) in self.mystack.enumerated() {
            if num <= curr { 
                return false
            }
            curr = num
        }
        return true
    }
}