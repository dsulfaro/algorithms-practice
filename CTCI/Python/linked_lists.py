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

l = LinkedList.LinkedList()
