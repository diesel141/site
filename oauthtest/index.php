<?php
// アプリケーション設定
define('CONSUMER_KEY', '【クライアントID】');
define('CALLBACK_URL', 'http://localhost:8080/auth2/callback');

// URL
define('AUTH_URL', 'https://accounts.google.com/o/oauth2/auth');


//--------------------------------------
// 認証ページにリダイレクト
//--------------------------------------
$params = array(
    'client_id' => CONSUMER_KEY,
    'redirect_uri' => CALLBACK_URL,
    'scope' => 'openid profile email',
    'response_type' => 'code',
);

// リダイレクト
header("Location: " . AUTH_URL . '?' . http_build_query($params));