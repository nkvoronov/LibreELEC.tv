<?php

$config = dirname(__FILE__)."/update_weather.config";
if( !file_exists( $config ) )
{
    echo "ERROR: config file <$config> does not exist!\n";
    return 1;
}
$ini_array = parse_ini_file($config);

$latitude = $ini_array['Latitude'];
$longitude = $ini_array['Longitude'];
$locationSkin = $ini_array['LocationSkin'];
$units = $ini_array['Units'];
$degree_sign = $ini_array['DegreeSign'];
$lang = $ini_array['Lang'];
$convertPoint = $ini_array['ConvertPoint2Comma'];
$api_key = $ini_array['ApiKey'];

$OUTPUTFLDRTEMP = "/tmp/skinflatplus/widgets/weather";
if( !file_exists($OUTPUTFLDRTEMP) )
    mkdir($OUTPUTFLDRTEMP, 0775, true);

include('lib/forecast.io.php');

// delete old files
array_map('unlink', glob($OUTPUTFLDRTEMP."/weather.*"));

// forecast query
$forecast = new ForecastIO($api_key);

$condition = $forecast->getCurrentConditions($latitude, $longitude, $units, $lang);
if( !$handle = fopen($OUTPUTFLDRTEMP."/weather.0.temp", "w") ) {
    print "can't create file!\n";
    return 2;
}
$temp = round($condition->getTemperature(), 1);
if( $convertPoint == 1 )
    $temp = str_replace(".", ",", $temp);
fwrite($handle, $temp);
fwrite($handle, $degree_sign);
fclose($handle);


// get daily conditions for next 7 days
$conditions_week = $forecast->getForecastWeek($latitude, $longitude, $units, $lang);

if( !$handle = fopen($OUTPUTFLDRTEMP."/weather.location", "w") ) {
    print "can't create file!\n";
} else {
    fwrite($handle, $locationSkin);
    fclose($handle);
}


$index = -1;
foreach($conditions_week as $conditions) {
    $index++;

    if( !$handle = fopen($OUTPUTFLDRTEMP."/weather.".$index.".summary", "w") ) {
        print "can't create file!\n";
        continue;
    }
    fwrite($handle, $conditions->getSummary());
    fclose($handle);

    if( !$handle = fopen($OUTPUTFLDRTEMP."/weather.".$index.".tempMin", "w") ) {
        print "can't create file!\n";
        continue;
    }
    // we only have min & max so we must calc
    $temp = round($conditions->getMinTemperature(), 1);
    if( $convertPoint == 1 )
        $temp = str_replace(".", ",", $temp);
    fwrite($handle, $temp);
    fwrite($handle, $degree_sign);
    fclose($handle);

    if( !$handle = fopen($OUTPUTFLDRTEMP."/weather.".$index.".tempMax", "w") ) {
        print "can't create file!\n";
        continue;
    }
    // we only have min & max so we must calc
    $temp = round($conditions->getMaxTemperature(), 1);
    if( $convertPoint == 1 )
        $temp = str_replace(".", ",", $temp);
    fwrite($handle, $temp);
    fwrite($handle, $degree_sign);
    fclose($handle);


    if( !$handle = fopen($OUTPUTFLDRTEMP."/weather.".$index.".precipitation", "w") ) {
        print "can't create file!\n";
        continue;
    }
    fwrite($handle, $conditions->getPrecipitationProbability());
    fclose($handle);

    if( !$handle = fopen($OUTPUTFLDRTEMP."/weather.".$index.".precipitationType", "w") ) {
        print "can't create file!\n";
        continue;
    }
    if( $conditions->getPrecipitationProbability() > 0 )
        fwrite($handle, $conditions->getPrecipitationType());
    else
        fwrite($handle, "none");
    fclose($handle);

    if( !$handle = fopen($OUTPUTFLDRTEMP."/weather.".$index.".icon", "w") ) {
        print "can't create file!\n";
        continue;
    }
    fwrite($handle, $conditions->getIcon());
    fclose($handle);
}
?>
