// This macro creates a Pascal VOC .xml annotations file from rectangle ROIs drawn in ImageJ/Fiji
// The .xml file can then be used in a Deep Learning model for object detection
// Open the Image and the corresponding ROIset.zip file and then run this macro
// It will save the .xml file in the same folder where the image was opened from

// Author: Ved P Sharma, July 17, 2021 (Version: 1)

title = getTitle();
savepath = getDir("image") + File.getNameWithoutExtension(title) + ".xml";
imgWidth = getWidth();
imgHeight = getHeight();

// get group information for ROIs
n = roiManager('count');
var groups = newArray; // global variable
for (i = 0; i < n; i++) {
    roiManager('select', i);
    addUniqueGroup(Roi.getGroup);
}
//Array.print(groups);

// User-input for defining class names for the groups
groupNums = groups.length;
Dialog.create("Pascal VOC xml generator...");
Dialog.addMessage("ROIs belong to "+groupNums+" group(s).\n Add their class names below.");
for (i = 0; i < groupNums; i++)
	Dialog.addString("Group "+groups[i]+":", "");
Dialog.show();
groupNames = newArray(groupNums);
for (i = 0; i < groupNums; i++) {
	groupNames[i] = Dialog.getString();
	if(groupNames[i] == "")
		exit("ERROR: No class name chosen for Group "+groups[i]);
}
//Array.print(groupNames);

// set ROI class names
n = roiManager('count');
roiClassNames = newArray(n);
for (j = 0; j < groupNums; j++) {
	for (i = 0; i < n; i++) {
    	roiManager('select', i);
    	if(Roi.getGroup == groups[j])
    		roiClassNames[i] = groupNames[j];
	}		
}
//Array.print(roiClassNames);

// convert (xmin, ymin, width, height) to (xmin, ymin, xmax, ymax)
xmin = newArray(n);
ymin = newArray(n);
xmax = newArray(n);
ymax = newArray(n);
for (i = 0; i < n; i++) {
    roiManager('select', i);
    getSelectionBounds(x, y, width, height);
    xmin[i] = x;
    ymin[i] = y;
    xmax[i] = x + width;
    ymax[i] = y + height;
}

// generate xml text and save it to a file
str = "<annotation>";
str += "\n\t<filename>"+title+"</filename>"
str += "\n\t<size>"
str += "\n\t\t<width>"+imgWidth+"</width>";
str += "\n\t\t<height>"+imgHeight+"</height>";
str += "\n\t\t<depth>3</depth>";
str += "\n\t</size>"
// add ROI object information
for (i = 0; i < n; i++) {
	str += "\n\t<object>";
	str += "\n\t\t<name>"+roiClassNames[i]+"</name>";
//	str += "\n\t\t<name>Particles</name>"; // class name could also be hardcoded here for a single object
	str += "\n\t\t<pose>Unspecified</pose>";
	str += "\n\t\t<truncated>Unspecified</truncated>";
	str += "\n\t\t<difficult>Unspecified</difficult>";
	str += "\n\t\t<bndbox>";
	str += "\n\t\t\t<xmin>"+xmin[i]+"</xmin>";
	str += "\n\t\t\t<ymin>"+ymin[i]+"</ymin>";
	str += "\n\t\t\t<xmax>"+xmax[i]+"</xmax>";
	str += "\n\t\t\t<ymax>"+ymax[i]+"</ymax>";
	str += "\n\t\t</bndbox>";
	str += "\n\t</object>";
}
str += "\n</annotation>";
//print(str);
File.saveString(str, savepath)
close("*");
close("Roi Manager");

function addUniqueGroup(number) {
	if(groups.length == 0 || notInGroups(number))
		groups = Array.concat(groups, number);
	return;
}

function notInGroups(a) {
	for (i = 0; i < groups.length; i++)
		if(a == groups[i])
			return false;
	return true;
}
