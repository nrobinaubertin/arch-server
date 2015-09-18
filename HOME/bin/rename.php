<?php

$entries = scandir($argv[1]);
//shift out "." and ".."
array_shift($entries);
array_shift($entries);

//what's the highest id ?
$max = 0;
foreach($entries as $e) {
	$p = pathinfo($e, PATHINFO_FILENAME);
	if(preg_match("/^\d+$/", $p) == 1) {
		$current = intval($p);
		$max = max($max,$current);
	}
}
echo($max);
//rename the files with a correct id
foreach($entries as $e) {
	$p = pathinfo($e, PATHINFO_FILENAME);
	if(preg_match("/^\d+$/", $p) != 1) {
		$max = $max+1;
		rename($e, $max.".".pathinfo($e, PATHINFO_EXTENSION));
	}
}
?>
