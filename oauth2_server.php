<?php

require_once 'oauth2-server-php-main/src/OAuth2/Autoloader.php';
OAuth2\Autoloader::register();

$dsn = 'mysql:dbname=musaka;host=localhost';
$username = 'musaka';
$password = 'cwkJ3s7FqvlY2xb';

// Create a storage object
$storage = new OAuth2\Storage\Pdo([
    'dsn' => $dsn, 
    'username' => $username, 
    'password' => $password
]);

// Create the server
$server = new OAuth2\Server($storage);

// Add the "Client Credentials" grant type
$server->addGrantType(new OAuth2\GrantType\ClientCredentials($storage));

// Add the "Authorization Code" grant type
$server->addGrantType(new OAuth2\GrantType\AuthorizationCode($storage));

// Add the "Password" grant type
$server->addGrantType(new OAuth2\GrantType\UserCredentials($storage));

// Add the "Refresh Token" grant type if needed
$server->addGrantType(new OAuth2\GrantType\RefreshToken($storage));
