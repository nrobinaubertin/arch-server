<?php

// function to process images uploaded by the user
function reducImage($from, $to) {
	
	$im = new Imagick();
	try {
		if(!$im->pingImage($from)) {
			throw new Exception("");
		}
	} catch(Exception $e) {
		return false;
	}
	try {
		if(!$im->readImage($from)) {
			throw new Exception("");
		}
	} catch(Exception $e) {
		return false;
	}

	$width = $im->getImageWidth();
	$height = $im->getImageHeight();

	$hw = $height / $width;
	$wh = $width / $height;

	//then we shorten the image 
	$new_width = min($width, 1920); 
	$new_height = $hw*$new_width; 
	$new_height = min($new_height, 1080); 
	$new_width = $wh*$new_height; 

	$im->thumbnailImage($new_width, $new_height);
	$im->setImageFormat('jpeg');
	$im->stripImage();
	$im->setImageCompression(Imagick::COMPRESSION_JPEG);
	$im->setImageCompressionQuality(85);
	$im->writeImage($to);
	$im->destroy();

    return file_exists($to);
}

reducImage($argv[1], $argv[2]);
