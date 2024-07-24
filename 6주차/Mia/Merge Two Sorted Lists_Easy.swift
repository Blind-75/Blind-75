class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let l1 = list1, let l2 = list2 else { return list1 ?? list2}

        if l1.val <= l2.val{
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        }else{
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }
}


// class Solution {
//     func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//         var p1 = list1
//         var p2 = list2 
//         var finalList: ListNode? 
//         var p3 = finalList

//         while p1 != nil && p2 != nil{
//             if p1!.val > p2!.val{
//                 guard let _ = finalList else {
//                     finalList = p2
//                     p3 = finalList
//                     p2 = p2?.next
//                     continue
//                 }
//                 p3?.next = p2 
//                 p3 = p3?.next
//                 p2 = p2?.next
//             }else{
//                 guard let _ = finalList else {
//                     finalList = p1
//                     p3 = finalList
//                     p1 = p1?.next
//                     continue
//                 }
//                 p3?.next = p1
//                 p3 = p3?.next
//                 p1 = p1?.next
//             }
//         }
//         if let _ = finalList{
//             if p1 != nil{
//                 p3?.next = p1
//             }
//             if p2 != nil{
//                 p3?.next = p2
//             }
//         }else{
//             if p1 != nil{
//                 finalList = p1
//             }
//             if p2 != nil{
//                 finalList = p2
//             }
//         }
//         return finalList
//     }
// }