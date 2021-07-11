<?php
$content = file_get_contents('Dockerfile');
$content = preg_replace_callback('/INCLUDE\((?<filename>[^)]+)\)/m', static function (array $matches) {
    return file_get_contents($matches['filename']);
}, $content);

echo $content, PHP_EOL;