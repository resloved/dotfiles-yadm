#!/usr/bin/env python3
import i3ipc

i3 = i3ipc.Connection()

name = i3.get_tree().find_focused().workspace().parent.parent.name
outputs = i3.get_outputs()

counter = 0
for output in outputs:
    if output.name != 'xroot-0':
        counter += 1
    if output.name == name:
        print(counter)
        break
