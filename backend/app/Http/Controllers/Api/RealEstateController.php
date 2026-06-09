<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\RealEstate;


use App\Http\Resources\RealEstateResource;
use App\Http\Requests\StoreRealEstateRequest;
use App\Http\Requests\UpdateRealEstateRequest;

class RealEstateController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request) // 👈 Request $request inject karein
    {
        // Base query select columns ke sath
        $query = RealEstate::select(
            'id',
            'name',
            'real_state_type',
            'city',
            'country',
            'rooms',
            'bathrooms'
        );

        // 🟢 1. Agar user ne City search ki hai
        if ($request->filled('city')) {
            $query->where('city', 'like', '%' . $request->city . '%');
        }

        // 🟢 2. Agar user ne Property Type select kiya hai
        if ($request->filled('type')) {
            $query->where('real_state_type', $request->type);
        }

        // Latest data return karein pagination ke sath
        return $query->latest()->paginate(10);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreRealEstateRequest $request)
    {
        $property = RealEstate::create(
            $request->validated()
        );

        return new RealEstateResource($property);
    }

    /**
     * Display the specified resource.
     */
    public function show(RealEstate $property)
    {
        return new RealEstateResource($property);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRealEstateRequest $request, RealEstate $property)
    {
        $property->update(
            $request->validated()
        );

        return new RealEstateResource(
            $property->fresh()
        );
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(RealEstate $property)
    {
        $deleted = $property->toArray();

        $property->delete(); // 

        return response()->json([
            'message' => 'Deleted Successfully',
            'data' => $deleted
        ]);
    }
}