<?php

namespace App\Http\Controllers;

use App\Models\RealEstate;

class DashboardController extends Controller
{
    public function index()
    {
        return view('dashboard', [

            'total' => RealEstate::count(),

            'houses' => RealEstate::where(
                'real_state_type',
                'house'
            )->count(),

            'departments' => RealEstate::where(
                'real_state_type',
                'department'
            )->count(),

            'lands' => RealEstate::where(
                'real_state_type',
                'land'
            )->count(),

            'commercials' => RealEstate::where(
                'real_state_type',
                'commercial_ground'
            )->count(),
        ]);
    }
}