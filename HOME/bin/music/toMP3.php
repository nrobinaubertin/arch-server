<?php

$lines = file($argv[1]);
$i = 0;
$n = count($lines);
foreach($lines as $l) {

	$plop = trim($l);
	$shellplop = escapeshellcmd($plop);

	$dir = pathinfo($plop, PATHINFO_DIRNAME); 
	$ext = pathinfo($plop, PATHINFO_EXTENSION); 
	$basename = pathinfo($plop, PATHINFO_BASENAME);
	$filename = pathinfo($plop, PATHINFO_FILENAME);
	$size = filesize($plop);
	$i++;

	echo("$filename\n");
	echo("$dir\n");
	echo("track $i of $n\n");
	echo("size before : $size\n");
	echo("converting...\n");
	exec("/usr/bin/ffmpeg -y -i '$shellplop' -vn -acodec libmp3lame '$dir/$filename.mp3'");
	$newsize = filesize("$dir/$filename.mp3");
	echo("conversion ended. newsize=$newsize\n");

	//if($newsize != "") {
	//	unlink($plop);
	//}
	echo("-------------------------------\n");
}
?>
