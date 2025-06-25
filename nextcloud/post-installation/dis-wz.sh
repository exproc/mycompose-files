export s=/var/www/html/occ
export p=/usr/local/bin/php
export SERVER_URL1=https://office.cchalifo.com
export SERVER_URL2=https://office.ccchalifo.net

#php 
$p $s app:disable firstrunwizard
$p $s app:install sociallogin
#Enable Office
$p $s app:install richdocuments
#$p $s config:app:set --value ${SERVER_URL1} richdocuments wopi_url
#$p $s config:app:set richdocuments wopi_url --value ${SERVER_URL2} 


$p $s db:add-missing-columns
$p $s db:add-missing-indices
$p $s db:add-missing-primary-keys

$p $s config:system:set maintenance_window_start --type=integer --value=1
$p $s maintenance:repair --include-expensive
$p $s db:add-missing-indices


