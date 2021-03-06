#!/usr/bin/env python2
# Written by Alex. Almeida https://www.ebi.ac.uk/about/people/alexandre-almeida

import os
import sys


if len(sys.argv) < 2:
    print "ERROR! usage: script.py rrna.tblout.deoverlapped"
    sys.exit()

rRNAs_exp = {"5S_rRNA": 119, "SSU_rRNA_archaea": 1477, "LSU_rRNA_archaea": 2990}
rRNAs_obs = {"5S_rRNA": [], "SSU_rRNA_archaea": [], "LSU_rRNA_archaea": []}
rRNAs_merged = {}

# store start and end position of each hit
with open(sys.argv[1], "rU") as f:
   for line in f:
       cols = line.split()
       rfam = cols[2]
       rfam_start = int(cols[5])
       rfam_end = int(cols[6])
       rRNAs_obs[rfam].append([rfam_start, rfam_end])

# sort intervals by start position and merge
for ele in rRNAs_obs.keys():
    rRNAs_merged[ele] = []
    try:
        saved = sorted(rRNAs_obs[ele])[0]
        for i in sorted(rRNAs_obs[ele]):
            if i[0] <= saved[-1]:
                saved[-1] = max(saved[-1], i[-1])
            else:
                rRNAs_merged[ele].append(tuple(saved))
                saved[0] = i[0]
                saved[1] = i[1]
        rRNAs_merged[ele].append(tuple(saved))
    except:
        rRNAs_merged[ele] = [0,0]

# calculate total length based on merged intervals
run_name = os.path.basename(sys.argv[1]).split("_all.tbl")[0]

for rna in rRNAs_merged.keys():
    totalLen = 0
    for interval in rRNAs_merged[rna]:
        try:
            totalLen += interval[1]-interval[0]
        except:
            totalLen = 0
    print "%s\t%s\t%.2f" % (run_name, rna, float(totalLen)/rRNAs_exp[rna]*100) 


