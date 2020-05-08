# Traffic Lights - using MQTT, Raspberry Pi and Sensehat

Sample flow that shows how MQTT interact with Raspberry Pi Sensehat.
Uses a time delay that sets the payload by turning RED, YELLOW or GREEN lights ON.

```
msg.payload = {"red":"1","yellow":"0","green":"0","colour":"red"}
msg.payload = {"red”:”0”,”yellow":"0","green”:”1”,”colour”:”green”}
msg.payload = {"red”:”0”,”yellow”:”1”,”green":"0","colour”:”yellow”}
```

To display the colour on sensehat, use:

```
var colour = ['*', '*', msg.payload.colour].toString();
node.send({payload:colour});
```

To display the traffic light image via /ui use this code:

```
<img height="400" src=/traffic-lights/{{msg.payload.colour}}.png>
```

Please see the following traffic images googled from some websites for demo purposes only. 
If possible resize or create your own. Be sure to upload the images under `/home/pi/images/traffic-lights.`
 
Settings on `~/.nodes/settings.json` is shown below:
```
httpStatic: '/home/pi/images',
```

### Requirements

The flow requires the installation of mosquito MQTT in localhost and a raspberry Pi Sensehat 

or use http://www.hivemq.com/demos/websocket-client/ as MQTT websocket client.

### Node-RED dependencies

+ `node-red-dashboard` to display the ui and image
+ `node-red-node-pi-sense-hat` to use pi sensehat

### Screenshots
