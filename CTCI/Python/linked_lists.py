# import the linked list module from the one that exists on my desktop
# delete if you want to implement linked list yourself
import types
import importlib.machinery
loader = importlib.machinery.SourceFileLoader('linked_list', './../../../datastructures/python/linked_list.py')
LinkedList = types.ModuleType(loader.name)
handle = loader.exec_module(LinkedList)

import math
# O(n^2) solution
def remove_dups_n2(ll):
    ptr = ll.head
    while ptr != None:
        runner = ptr
        repeat_found = False
        while runner != None and runner.next != None:
            if ptr.data == runner.next.data:
                repeat_found = True
                runner.next = runner.next.next
            runner = runner.next
        if not repeat_found:
            ptr = ptr.next


def remove_dups_n(ll):
    seen = {}
    ptr = ll.head
    while ptr != None:
        seen[ptr.data] = True
        ptr = ptr.next
    new_linked_list = LinkedList.LinkedList()
    for key in seen:
        new_linked_list.push(key)
    ll.head = new_linked_list.head

def kth_to_last(ll, k):
    if k < 1 or k > ll.length:
        return "Invalid k: list not long enough"
    if ll.head == None:
        return "List is empty"
    runner = ll.head
    i = 0
    while i != k:
        runner = runner.next
        i += 1
    result = ll.head
    while runner != None:
        runner = runner.next
        result = result.next
    return result.data

def delete_from_middle(victim):
    while victim.next != None:
        victim.data = victim.next.data
        if victim.next.next == None:
            victim.next = None
        else:
            victim = victim.next

def partition(ll, val):
    ptr = ll.head
    runner = ptr.next
    while runner != None:
        if ptr.data >= val:
            while runner != None and runner.data >= val:
                runner = runner.next
            if runner != None:
                ptr.data, runner.data = runner.data, ptr.data
            else:
                break
        else:
            ptr = ptr.next

def list_to_string(l):
    result = ""
    ptr = l.head
    while ptr != None:
        result += str(ptr.data)
        ptr = ptr.next
    return result

def list_to_int(l):
    digit = 1
    total = 0
    ptr = l.head
    while ptr != None:
        total += ptr.data * digit
        ptr = ptr.next
        digit *= 10
    return total

def sum_lists_with_strings(l1, l2):
    num1 = int(list_to_string(l1)[::-1])
    num2 = int(list_to_string(l2)[::-1])
    summed = str(num1 + num2)[::-1]
    result = LinkedList.LinkedList()
    for c in summed:
        result.push(int(c))
    return result

def sum_lists_without_strings(l1, l2):
    num1 = list_to_int(l1)
    num2 = list_to_int(l2)
    summed = num1 + num2
    result = LinkedList.LinkedList()
    while summed > 0:
        result.push(summed % 10)
        summed //= 10
    return result

def is_palindrome(l):
    length = l.length
    idx = 1
    count = 1
    left = 0
    right = 0
    ptr = l.head
    while ptr != None:
        if length % 2 != 0 and count == math.ceil(length / 2):
            ptr = ptr.next
            count += 1
            continue
        if count <= length // 2:
            left += ptr.data * idx
            idx += 1
        else:
            idx -= 1
            right += ptr.data * idx
        count += 1
        ptr = ptr.next
    print (left, right)
    return left == right

def intersection(l1, l2):
    # get lengths of both
    # if last nodes arent the same, return False
    # else
    # have two pointers start at each head
    # advance the pointer of the longest list and decrement the length variable
    # until both lengths are the same
    # then advance both pointers at the same time and they should meet
    return

def cycle_start(l):
    # O(n) time - O(n) space
    # Assuming all values in linked list are unique otherwise, this would break
    # To get around that, store their references instead, but for simplicity's sake, I'm just doing the data
    values = {}
    ptr = l.head
    loop_val = None
    # find the unique value at which the list repeats and save it into loop_val
    while True:
        if values.has_key(ptr.data):
            loop_val = ptr.data
            break
        else:
            values[ptr.data] = True
            ptr = ptr.next
    # start back at the beginning and go until you find the node with that value
    ptr = l.head
    while True:
        if ptr.data == loop_val:
            return ptr
        else:
            ptr = ptr.next


l1 = LinkedList.LinkedList()
l1.push(1)

l2 = LinkedList.LinkedList()
l2.push(1)
l2.push(2)
l2.push(2)
l2.push(1)
