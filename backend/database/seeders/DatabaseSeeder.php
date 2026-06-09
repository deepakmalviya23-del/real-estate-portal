<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\RealEstate;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        RealEstate::factory()
            ->count(20)
            ->create();
    }
}
