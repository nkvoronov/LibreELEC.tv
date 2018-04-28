<?php

$handle = fopen ("php://stdin","r");
echo "Country (like DE for Germany): ";
$country = fgets($handle);
echo "City (like Berlin): ";
$city = fgets($handle);

// get lat & long from google maps
$MAPSURL = "http://maps.googleapis.com/maps/api/geocode/json?address=".$city.",".$country."&sensor=false";
$json = file_get_contents($MAPSURL);
$data = json_decode($json, true);

if( !isset($data['results'][0]) ) { 
    echo "no latitude and longitude find for: ".$city.",".$country." !\n";
    exit;
}
$latitude  = $data['results'][0]['geometry']['location']['lat'];
$longitude = $data['results'][0]['geometry']['location']['lng'];

echo "Latitude =  ".$latitude."\n";
echo "Longitude = ".$longitude."\n";
echo "LocationSkin = ".$city."\n";

echo "put these values in update_weather.config\n";

?>
