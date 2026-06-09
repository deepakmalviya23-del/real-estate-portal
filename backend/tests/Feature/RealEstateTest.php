<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class RealEstateTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_example(): void
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }

    public function test_property_list()
    {
        RealEstate::factory()
            ->count(5)
            ->create();

        $response = $this->getJson(
            '/api/properties'
        );

        $response->assertStatus(200);
    }

    public function test_property_store()
    {
        $response = $this->postJson(
            '/api/properties',
            [
                'name' => 'Test Property',
                'real_state_type' => 'house',
                'street' => 'ABC Road',
                'external_number' => '12A',
                'neighborhood' => 'Area',
                'city' => 'Delhi',
                'country' => 'IN',
                'rooms' => 2,
                'bathrooms' => 1
            ]
        );

        $response->assertStatus(201);
    }

    public function test_property_show()
    {
        $property = RealEstate::factory()
            ->create();

        $response = $this->getJson(
            "/api/properties/{$property->id}"
        );

        $response->assertStatus(200);
    }

    public function test_property_update()
    {
        $property = RealEstate::factory()
            ->create();

        $response = $this->putJson(
            "/api/properties/{$property->id}",
            [
                'name' => 'Updated Name'
            ]
        );

        $response->assertStatus(200);
    }

    public function test_property_delete()
    {
        $property = RealEstate::factory()
            ->create();

        $response = $this->deleteJson(
            "/api/properties/{$property->id}"
        );

        $response->assertStatus(200);
    }
    
}
