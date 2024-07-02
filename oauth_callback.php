<?php
require_once 'oauth2_server.php';

// Start session if not already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Get the authorization code from the query parameters
$authorizationCode = $_GET['code'];

// Exchange the authorization code for an access token
$request = OAuth2\Request::createFromGlobals();
$response = new OAuth2\Response();

$server->handleTokenRequest($request, $response);

if ($response->isSuccessful()) {
    // The response contains the access token
    $tokenData = $response->getParameters();
    
    // Store the access token in the session (or wherever you need it)
    $_SESSION['access_token'] = $tokenData['access_token'];

    // Redirect the user to the main application page or wherever you need
    header('Location: /path/to/your/application');
    exit;
} else {
    // Handle error
    echo 'Error: ' . $response->getStatusCode() . ' - ' . $response->getStatusText();
    exit;
}
?>
