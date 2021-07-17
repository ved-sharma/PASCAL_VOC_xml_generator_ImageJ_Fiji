## Create bounding box annotations in Pascal VOC xml format using ImageJ/Fiji to use in training a Deep Learning object detection model 
There are many open-source softwares/web-tools (e.g. MakeSense, Img--) available for making bounding box annotations in images and saving them in Pascal VOC format for the downstream processing in a Deep Learning model for object detection.

## Why do I need an annotaion tool based on ImageJ/Fiji
I can think of three reasons:
1. If you have already drawn and saved your bounding box rectangle ROIs in ImageJ/Fiji, and you don't want to annotate your images all over again, then you can use the macro here to convert those rectangle ROIs to a Pascal VOC .xml file. 
2. Some web-tools do not allow you to upload a partially annotated image and continue from where you left off. This is where ImageJ/Fiji based annotation tool can help. You can stop at anytime by saving your ROIs and then come back to annotating from where you left off.
3. If you are already familiar and confortable with drawing ROIs in ImageJ/Fiji and don't want to learn any other software or web-tool. 

## How does it work
**Step 1**: Go to step 2 if you have already created bounding box rectangle ROIs around your objects-of-interest.  
Otherwise, Open you images one by one in ImageJ/Fiji and start drawing rectangle ROIs around the your objects-of-interest and add them to the ROI Manager. If you have more than one type of objects, then you can group them together by defining the group number (1,2... so one). If there is only one type of object you are interested in annotating, then there is no need for grouping.

![image of ROI Manager showing the group option]()

**Step 2**: Keep all of your images and the corresponding ROIs.zip files in a folder. Open one image and its corresponding ROIs set in ImageJ/Fiji and run the macro
Note: the ROI names will be 


**Step 3**: Keep

**Step 1**: Keep
