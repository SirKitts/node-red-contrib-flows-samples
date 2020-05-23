# AWS Rekognition - using WebCam/PiCam, Raspberry Pi and Sensehat

Sample flow that shows how Webcam/PiCam in Raspberry Pi interacts with aws-rekognition.

Input: Webcam/PiCam

Output: Sensehat RED (denied) or GREEN (granted)

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

### Setup and testing
(1) Install aws-cli

```
https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html
```

(2) Copy the all the pics files (ie *.png and *.sh) into `/home/pi/rekognize`

```
cd /home/pi
mkdir /rekognize
cd recognize
(then copy all the files from the /pics folder from github)
```

(3) Create an aws S3 bucket

(4) Upload the target.jpg and a source.jpg in the S3 bucket

```
aws s3 mb s3://name-of-your-s3-bucket-123
aws s3 cp target.jpg s3://name-of-your-s3-bucket-123
```

(5) Run node-red

(6) Upload the flow `flows-aws-rekognition`

(7) Once loaded, Deploy and test by clicking `Test Only` inject node

(8) Sensehat should turn green or red depending in the source image uploaded

### For Actual Testing:
(1) Take a selfie photo from either a webcam or picam by clicking the `WebCam Photo` or `PiCam` inject node
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
![](https://github.com/SirKitts/node-red-contrib-flows-samples/blob/master/aws-rekognition/screenshots/flow-aws-rekognition-with-camera-pi-sensehat.png)
