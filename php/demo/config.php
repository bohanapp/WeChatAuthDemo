<?php if (!defined('WX_AUTH_DEMO')) { die('Unauthorized Access!'); }

error_reporting(E_ALL);
date_default_timezone_set('Asia/Shanghai');

/* !!! 请配置以下信息 !!! */

// SDK路径
define('WX_AUTH_SDK_PATH', __DIR__ . '/../sdk/');

// 若使用demo自带的文件存储，请创建数据文件存储的目录，并保证目录可写
// 为避免数据泄露，请不要使用默认路径
define('WX_AUTH_STORE_PATH', __DIR__ . '/_store/');

// RSA密钥地址
define('WX_AUTH_RSA_PRIVATE_KEY', __DIR__ . '/_key/rsa_private.key');

// 应用的AppID及AppSecret，可在open.weixin.qq.com中找到，应与app客户端一致
define('WX_APP_ID', 'wxbeafe42095e03edf');
define('WX_APP_SECRET', '52bdd90af64b2f70f28bfe19532befb1');

// 加密登录票据(token、密码等)的盐
define('WX_AUTH_SALT', 'WxAuthDemo');

// 票据相关时间，单位为秒
// define('WX_LOGIN_TOKEN_EXPIRE_CREATE_TIME', 60*60*24*30);
// define('WX_LOGIN_TOKEN_EXPIRE_LAST_LOGIN_TIME', 60*60*24*7);
// define('WX_AUTH_SESSION_KEY_EXPIRE_TIME', 60*5);
define('WX_LOGIN_TOKEN_EXPIRE_CREATE_TIME', 60*60*24*30);
define('WX_LOGIN_TOKEN_EXPIRE_LAST_LOGIN_TIME', 60*60*24*7);
define('WX_AUTH_SESSION_KEY_EXPIRE_TIME', 60*60);

/* !!! 请配置以上信息 !!! */


// 用于appServer->appClient的response的API返回码，
// 可根据自己的业务情况自定义



function v($value) {
	echo '<pre>';
	print_r($value);
	echo '</pre>';
}

function wxlog($str) {
	if (!is_string($str)) {
		$str = json_encode($str);
	}
	$fp = fopen(WX_AUTH_STORE_PATH.'/log.txt', 'a');
	fwrite($fp, date('[m-d H:i:s]')." ".$str."\n");
	fclose($fp);
}

/* END file */