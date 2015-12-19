#!/bin/python
import SimpleHTTPServer

map = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map

map[""] = "text/plain"
for key, value in map.items():
  map[key] = value + ";charset=UTF-8"

SimpleHTTPServer.test()
