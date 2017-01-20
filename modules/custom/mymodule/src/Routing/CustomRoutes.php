<?php

namespace Drupal\mymodule\Routing;
use Symfony\Component\Routing\Route;

class CustomRoutes {
    public function routes() {
        $routes = [];
        
        // Create mypage route programmatically
        $routes['mymodule.mypagerp'] = new Route(
            // Path definition
            'mypagerp',
            // Route defaults
            [
                '_controller' => '\Drupal\mymodule\Controller\PageController::customPageRP',
                '_title' => 'My custom page RP',
            ],
            // Route requirements
            [
                '_permission' => 'access content',
            ]
        );
        return $routes;
    }
}