import requests
import json
from datetime import date
import time

#with open('testing.jpg', 'rb') as fp:
#    response = requests.post(
#                'https://api.platerecognizer.com/v1/plate-reader/',
#                data=dict(regions='us'),  # Optional
#                files=dict(upload=fp),
#                headers={'Authorization': 'Token aa97256b33c21e5d3453df158a0313e94ba557f7'})
#print(response.json())
actionObj = {
                "book": "ooo",
                "chapter": "",
                "paragraph": ""
            }
sectioObj = {
                "book": "",
                "chapter": "",
                "paragraph": ""
            }
myobj = {"action":actionObj, "section":sectioObj}
myobj['action']['book']="ooooo"
x = requests.post('http://localhost:8080/', data = myobj)
#with open('testing.jpg', 'rb') as fp:
 #   response = requests.post(
  #              'https://loteye.ue.r.appspot.com/img',
   #             files=dict(upload=fp))
print(x.text)
