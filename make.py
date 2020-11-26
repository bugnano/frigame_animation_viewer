#! /usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import os

import glob

from jinja2 import (Environment, FileSystemLoader, Template)

def main():
	env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)
	template = env.get_template('index.tmpl.html')
	template_output = template.render({'images': sorted(glob.glob('img/**/*.*', recursive=True))})
	with open('index.html', 'w') as f:
		f.write(template_output)

if __name__ == '__main__':
	sys.exit(main())

