#!/usr/bin/env python

import yaml
from subprocess import call

dest_dir = "generated_models"

with open("enclosure.yaml", 'r') as f:
	doc = yaml.load(f)
width = doc["width"]

#determine 

print "Generating models..."

for i in range(0, 3):
	for j in range(0, 3):
		call(["openscad", "-o"+dest_dir+"/gen_plate_test_"+str(i)+"_"+str(j)+".stl", "-D width=200", "-D depth=200", "-D thickness=3", "-D corner_cut=10", "-D cutout_dist=20", "-D chamfer=0.5", "-D bolt_space=10", "gen_plate.scad"])
