<?php

$lines = file($argv[1]);
$i = 0;
$n = count($lines);
foreach($lines as $l) {

	//$plop = urlencode($l);
	$plop = trim($l);
	$shellplop = escapeshellcmd($plop);

	$dir = pathinfo($plop, PATHINFO_DIRNAME); 
	$ext = pathinfo($plop, PATHINFO_EXTENSION); 
	$basename = pathinfo($plop, PATHINFO_BASENAME);
	$filename = pathinfo($plop, PATHINFO_FILENAME);
	$size = filesize($plop);
	$i++;

	echo("-------------------------------\n");
	echo("$filename\n");
	echo("$dir\n");
	echo("track $i of $n\n");
	//echo("$ext\n"); 
	//echo("$size\n");
	
	$quality = 6;

	exec("/usr/bin/ffmpeg -y -loglevel quiet -i $shellplop -vn -acodec libvorbis -q:a $quality $dir/$filename.ogg");
	$newsize = filesize("$dir/$filename.ogg");
	echo("conversion ended. newsize=$newsize\n");

	if($newsize > $size && $quality > 2) {
		$quality--;
		echo("new conversion !\n");
		unlink("$dir/$filename.ogg");
		exec("/usr/bin/ffmpeg -y -loglevel quiet -i $shellplop -vn -acodec libvorbis -q:a 5 $dir/$filename.ogg");
		$newsize = filesize("$dir/$filename.ogg");
		echo("conversion ended. newsize=$newsize\n");
	}

	if($newsize != "") {
		unlink($plop);
	}
	echo("-------------------------------\n");
}
?>
