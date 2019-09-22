# -*- coding: utf-8 -*-
#!/usr/bin/env python
# saved to ~/bin/batcharge.py and from
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/#my-right-prompt-battery-capacity

import math, subprocess

p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
output = p.communicate()[0]

o_max = [l for l in output.splitlines() if 'MaxCapacity' in l][0]
o_cur = [l for l in output.splitlines() if 'CurrentCapacity' in l][0]

b_max = float(o_max.rpartition('=')[-1].strip())
b_cur = float(o_cur.rpartition('=')[-1].strip())

charge = b_cur / b_max
charge_threshold = int(math.ceil(10 * charge))

# Output

total_slots, slots = 10, []
filled = int(math.ceil(charge_threshold * (total_slots / 10.0))) * u'■'
# old arrow: ▹▸▶
empty = (total_slots - len(filled)) * u'◻'

out = (filled + empty).encode('utf-8')
import sys

color_green = '%{[32m%}'
color_yellow = '%{[33m%}'
color_red = '%{[31m%}'
color_reset = '%{[00m%}'
third_of_slots = total_slots/3
color_out = (
    color_green if len(filled) > third_of_slots * 2
    else color_yellow if len(filled) > third_of_slots
    else color_red
)

out = color_out + out + color_reset
sys.stdout.write(out)
