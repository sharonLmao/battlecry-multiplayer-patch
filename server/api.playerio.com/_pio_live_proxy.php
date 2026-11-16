<?php
// Added 2026-11-16: forwards Player.IO API calls from Flashpoint to live api.playerio.com,
// and logs readable tokens from each request so we can see connection/room names.
// To undo everything, delete the folder Legacy/cgi-bin/api.playerio.com.
function pio_tokens($bin) {
	if ($bin === '') return '';
	preg_match_all('/[\x20-\x7e]{3,40}/', $bin, $m);
	$toks = array();
	foreach ($m[0] as $t) {
		if (preg_match('/^[A-Za-z0-9_\-\.\/ ]+$/', $t)) { $toks[] = $t; }
		if (count($toks) >= 8) break;
	}
	return implode(' | ', $toks);
}
function pio_live_proxy($path) {
	$method = isset($_SERVER['REQUEST_METHOD']) ? $_SERVER['REQUEST_METHOD'] : 'GET';
	$body = ($method === 'POST') ? file_get_contents('php://input') : '';
	$headers = "Accept-Encoding: identity\r\nConnection: close\r\n";
	if (isset($_SERVER['HTTP_PLAYERTOKEN'])) {
		$headers .= 'playertoken: ' . $_SERVER['HTTP_PLAYERTOKEN'] . "\r\n";
	}
	$http = array('method' => $method, 'header' => $headers, 'ignore_errors' => true, 'timeout' => 30);
	if ($method === 'POST') {
		$http['header'] .= "Content-Type: application/x-www-form-urlencoded\r\n";
		$http['content'] = $body;
	}
	$ctx = stream_context_create(array('http' => $http));
	$response = false;
	foreach (array('http://', 'https://') as $scheme) {
		$response = @file_get_contents($scheme . 'api.playerio.com' . $path, false, $ctx);
		if ($response !== false) { break; }
	}
	@file_put_contents(dirname(__FILE__) . '/_pio_log.txt',
		date('H:i:s') . '  ' . str_pad($path, 16) .
		' req[' . pio_tokens($body) . ']' .
		' -> ' . ($response === false ? 'FAILED' : (strlen($response) . 'B  resp[' . pio_tokens($response) . ']')) .
		"\n", FILE_APPEND);
	if ($response !== false && preg_match('#/api/(24|27|13|30|40)$#', $path)) {
		@file_put_contents(dirname(__FILE__) . '/_pio_raw_room.bin', $response);
	}
	if ($response === false) { return; }
	header('Content-Type: application/octet-stream');
	header('Content-Length: ' . strlen($response));
	echo $response;
}
