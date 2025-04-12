<?php
    $GLOBALS['db_host'] = 'localhost';
    $GLOBALS['db_name'] = 'burgerhouse';
    $GLOBALS['db_user'] = 'root';
    $GLOBALS['db_pass'] = '';
    require_once 'vendor/autoload.php';

    $client = new Google_Client();
    $client->setClientId('1073467551510-i92nbmrboo3k0nbtp65unlqthujbv6uj.apps.googleusercontent.com');
    $client->setClientSecret('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');
    $client->setRedirectUri('http://localhost/burgerhouse/?c=CCLoginGoogleCallback');
    $client->addScope('email');
    $client->addScope('profile');

    $authUrl = $client->createAuthUrl();
    header('Location: ' . filter_var($authUrl, FILTER_SANITIZE_URL));
?>