# import xml.etree.ElementTree as ET
# mytree = ET.parse('certs.svg')
# myroot = mytree.getroot()
# ns_array={
#     'svg': 'http://www.w3.org/2000/svg',
#     'xlink':'http://www.w3.org/2000/xlink'
# }

# #for child in myroot:
#  #   print(child.tag, child.attrib)

# for text in myroot.findall:
#     answer = text.find('text')
#     print(answer)

# #print(myroot)
# print(myroot[5].attrib["id"])
# # element = myroot[5].attrib["id"] 
# # print(element.tag)
# #print(myroot.findall('svg:g/svg:g/svg:g/svg:g', ns_array))

from svgelements import *
svg = SVG.parse('certs1.svg')
# print(svg.elements())

for elements in svg.elements():
    print(elements.values)
        