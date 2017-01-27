# import the linked list module from the one that exists on my desktop
# delete if you want to implement linked list yourself
import types
import importlib.machinery
loader = importlib.machinery.SourceFileLoader('linked_list', './../../../datastructures/python/linked_list.py')
LinkedList = types.ModuleType(loader.name)
handle = loader.exec_module(LinkedList)

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

l = LinkedList.LinkedList()
l.push(3)
l.push(5)
l.push(8)
l.push(5)
l.push(10)
l.push(2)
l.push(1)
partition(l, 5)
l.display()
