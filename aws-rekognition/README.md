# node-red-contrib-flows-samples/aws-rekognition

Sample flow that shows how Webcam/PiCam in raspberry to interact with aws-rekognition.
Input: Webcam/PiCam
Output: Sensehat RED (denied) or GREEn (granted)

```
msg.payload = {"access":"denied","colour":"red"}
msg.payload = {"access":"granted","colour”:”green”}
```

To display the colour on sensehat, use:

```
var colour = ['*', '*', msg.payload.colour].toString();
node.send({payload:colour});
```

Please use the aws-rekognition sample images (from AWS) for testing purposes only. 
rename one of the sources *.jpg to source.jpg then click button "Test only"

### Requirements

The flow requires the installation of aws-cli in localhost and a raspberry Pi Sensehat.
Webcam and/or Raspberry PiCam should also be installed

(1) Install aws-cli
```
please see how to install aws-cli - tba
```
(2) copy the all the pics files (ie *.png and *.sh) into 
```
cd /home/pi
mkdir /rekognize
cd recognize
(of course, you need to download all the images from /pics folder from github)
```
(3) Create an aws S3 bucket
(4) Upload the target.jpg and a source.jpg in the S3 bucket
```
aws s3 cp target.jpg s3://name-of-your-s3-bucket-123
```
(5) Run node-red
(6) Upload the flow `flows-aws-rekognition`
(7) once loaded, test by clicking `test inject node`
(8) Sensehat should turn green or red depending in the source image uploaded

For Actual Testing:
(1) Take a selfie photo from either a webcam or picam by clicking the `webcam/picam inject node`
(2) Sensehat should turn `RED`
(3) Now change the target.jpg with the photo created in step 1
(4) Then, do step 1
(5) Sensehat should turn `GREEN`
(6) Take a photo with a friend or just the back of your head.
(7) Sensehat should turn `RED`

### Node-RED dependencies

+ `node-red-dashboard` to display the ui and image
+ `node-red-node-pi-sense-hat` to use pi sensehat

### Screenshots
![2019-06-08_23-18-00](https://github.com/SirKitts/node-red-contrib-flows-samples/blob/sample/aws-rekognition/pi-trafficlights/screenshots/flow-traffic-lights-with-mqtt-pi-sensehat.png)