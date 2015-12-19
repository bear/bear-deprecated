#!/bin/python
import sys
import requests

method = sys.argv[1].lower().strip()
url    = sys.argv[2]

if method == 'options':
  r = requests.options(url)
  if 'allow' in r.headers:
    print r.headers['allow']
elif method == 'head':
  r = requests.head(url)
  print r.headers
else:
  r = requests.get(url)
  print r.text
