<?php

namespace Database\Factories;

use App\Models\RealEstate;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<RealEstate>
 */
class RealEstateFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    protected $model = \App\Models\RealEstate::class;
    public function definition(): array
    {
        $types = [
            'house',
            'department',
            'land',
            'commercial_ground'
        ];

        $type = fake()->randomElement($types);

        return [
            'name' => fake()->company(),

            'real_state_type' => $type,

            'street' => fake()->streetName(),

            'external_number' => strtoupper(
                fake()->bothify('##??')
            ),

            'internal_number' => in_array(
                $type,
                ['department','commercial_ground']
            )
                ? strtoupper(fake()->bothify('?##'))
                : null,

            'neighborhood' => fake()->citySuffix(),

            'city' => fake()->city(),

            'country' => 'IN',

            'rooms' => fake()->numberBetween(0,8),

            'bathrooms' => fake()->randomFloat(1,0,5),

            'comments' => fake()->sentence()
        ];
    }
}
