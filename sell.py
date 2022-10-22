#Authenticate to with User Credentials into the FTX Api

import time
import hmac
from requests import Request, Session, Response
import requests
import os
import json
from client import FtxClient
import pandas as pd
import json, urllib, csv
import pandas as pd
from dotenv import load_dotenv
load_dotenv()
client = FtxClient()


API_KEY_SECRET = os.getenv('API_KEY_SECRET')
API_KEY = os.getenv('API_KEY')

market = client._get(f'markets/AMPL/USDT')
best_bid = market['bid']*1.1
 
# get balances now
 
balances = client._get(f'wallet/balances')
df = pd.DataFrame(balances)
df2 = df.iloc[:,[0,2]]
df3 = df2.loc[df2['coin']=='AMPL']
df4 = df3.iloc[0][1]

#place order
data = json.dumps({
        "market":"AMPL/USDT",
        "side":"sell",
        "size":df4, #all of my ampl value
        "reduceOnly":False,
        "type":"limit",
        "price": best_bid
})


ts = int(time.time() * 1000)
request = Request('POST', 'https://ftx.com/api/orders', data=data)
prepared = request.prepare()
s = Session()
signature_payload = f'{ts}{prepared.method}{prepared.path_url}'
if prepared.body:
    signature_payload += prepared.body
signature_payload = signature_payload.encode()
signature = hmac.new(API_KEY_SECRET.encode(), signature_payload, 'sha256').hexdigest()

prepared.headers['FTX-KEY'] = API_KEY
prepared.headers['FTX-SIGN'] = signature
prepared.headers['FTX-TS'] = str(ts)


response = s.send(prepared)
data = response.json()
print(data)