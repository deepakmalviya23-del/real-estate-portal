<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\RealEstate;
use Illuminate\Http\Request;

class PropertyController extends Controller
{
    public function index()
    {
        $properties = RealEstate::latest()->paginate(10);

        return view(
            'admin.properties.index',
            compact('properties')
        );
    }

    public function create()
    {
        return view('admin.properties.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'real_state_type' => 'required',
            'street' => 'required',
            'external_number' => 'required',
            'neighborhood' => 'required',
            'city' => 'required',
            'country' => 'required',
            'rooms' => 'required|integer',
            'bathrooms' => 'required|numeric',
        ]);

        RealEstate::create([
            'name' => $request->name,
            'real_state_type' => $request->real_state_type,
            'street' => $request->street,
            'external_number' => $request->external_number,
            'internal_number' => $request->internal_number,
            'neighborhood' => $request->neighborhood,
            'city' => $request->city,
            'country' => $request->country,
            'rooms' => $request->rooms,
            'bathrooms' => $request->bathrooms,
            'comments' => $request->comments,
        ]);

        return redirect()
            ->route('properties.index')
            ->with('success', 'Property Created Successfully');
    }

    public function edit(RealEstate $property)
    {
        return view(
            'admin.properties.edit',
            compact('property')
        );
    }

    public function update(Request $request, RealEstate $property)
    {
        $property->update($request->all());

        return redirect()
            ->route('properties.index')
            ->with('success','Property Updated');
    }

    public function destroy(
        RealEstate $property
    ) {
        $property->delete();

        return redirect()
            ->route('properties.index');
    }
}