<?php
use App\Http\Controllers\Api\RealEstateController;

Route::apiResource('properties', RealEstateController::class)
    ->names('api.properties');