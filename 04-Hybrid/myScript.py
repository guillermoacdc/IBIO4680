#!/usr/bin/python -O


from PIL import Image
im = Image.open("imgs/imgG.jpg")
im.show()
whos
import sys
sys.exit()




from PIL import Image
import requests
from io import BytesIO
url='https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2015/09/1441780452brick-house.png'
response = requests.get(url)
img = Image.open(BytesIO(response.content))
img.show()
img
whos
