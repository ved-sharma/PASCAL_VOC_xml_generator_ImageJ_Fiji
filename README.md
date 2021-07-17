## Create bounding box annotations in Pascal VOC .xml format using [ImageJ/Fiji](https://imagej.net/)
There are many open-source softwares/web-tools (e.g. [MakeSense](https://github.com/SkalskiP/make-sense), [LabelImg](https://github.com/tzutalin/labelImg
)) available for making bounding box annotations in images and saving them in Pascal VOC format for the downstream processing in a Deep Learning model for object detection.


## Why do I need an annotaion tool based on ImageJ/Fiji
I can think of two reasons:
1. If you have already drawn and saved your bounding box rectangle ROIs in ImageJ/Fiji, and you don't want to annotate your images all over again, then you can use the macro here to convert those rectangle ROIs to a Pascal VOC .xml file. 
2. If you are already familiar and confortable with drawing ROIs in ImageJ/Fiji and don't want to learn any other software or web-tool. 

## How does it work
### Step 1: 
Go to step 2 if you have already created bounding box rectangle ROIs around your objects-of-interest.  

Otherwise, open you images one-by-one in ImageJ/Fiji and start drawing rectangle ROIs around your objects-of-interest and add them to the ROI Manager. If you have more than one type of objects, then you can group them together by adding their group numbers (1,2... so one) by selecting *Properties...* in the ROI Manager (see step 2 for more details on adding the group numbers). If there is only one type of object you are interested in annotating, then there is no need for defining the group number.

### Step 2: 
Keep all of your images and the corresponding ROIs.zip files in a folder. Open one image and its corresponding ROIs.zip file in ImageJ/Fiji and run the [PASCAL VOC xml generator macro](https://github.com/ved-sharma/PASCAL_VOC_xml_generator_ImageJ_Fiji/blob/ddc2599146b171bcdcc25ea3ef31f13e45f9f3ec/PASCAL_VOC_xml_generator.ijm)  

#### Case 1: Annotating objects of a single type  
Running the macro will open up a dialog box, where user can enter the class name of the objects. After user hits OK, an .xml file is generated at the same location where the image was opened from.

![](https://github.com/ved-sharma/PASCAL_VOC_xml_generator_ImageJ_Fiji/blob/ddc2599146b171bcdcc25ea3ef31f13e45f9f3ec/Files/one_group_example.png)

#### Case 2: Annotating objects of two or more types  
Running the macro will open up a dialog box, where user can enter the class names of the objects. After user hits OK, an .xml file is generated at the same location where the image was opened from.  

In the following example user drew two types of ROIs - Round (shown in blue, group 1) and Elongated (shown in red, group 2) 

![](https://github.com/ved-sharma/PASCAL_VOC_xml_generator_ImageJ_Fiji/blob/ddc2599146b171bcdcc25ea3ef31f13e45f9f3ec/Files/two_groups_example.png)

## Questions
[Image.sc](https://forum.image.sc/) is the best place to ask questions about this macro. Please post your question with @vedsharma tag so I recieve your message.

