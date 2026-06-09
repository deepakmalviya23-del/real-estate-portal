@extends('layouts.admin')

@section('content')
<div class="flex justify-between items-center mb-6">
    <h1 class="text-3xl font-bold text-gray-800">Add Property</h1>
</div>
@if ($errors->any())
    <div class="bg-red-100 p-3 mb-4">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
<form action="{{ route('properties.store') }}" method="POST">
    @csrf

    <div class="mb-3">
        <label>Name</label>
        <input type="text" name="name" class="border p-2 w-full">
    </div>

    <div class="mb-3">
        <label>Type</label>
        <select name="real_state_type" class="border p-2 w-full">
            <option value="house">House</option>
            <option value="department">Department</option>
            <option value="land">Land</option>
            <option value="commercial_ground">Commercial</option>
        </select>
    </div>

    <div class="mb-3">
        <label>Street</label>
        <input type="text" name="street" class="border p-2 w-full">
    </div>

    <div class="mb-3">
        <label>External Number</label>
        <input type="text" name="external_number" class="border p-2 w-full">
    </div>

    <div class="mb-3">
        <label>Internal Number</label>
        <input type="text" name="internal_number" class="border p-2 w-full">
    </div>

    <div class="mb-3">
        <label>Neighborhood</label>
        <input type="text" name="neighborhood" class="border p-2 w-full">
    </div>

    <div class="mb-3">
        <label>City</label>
        <input type="text" name="city" class="border p-2 w-full">
    </div>

    <div class="mb-3">
        <label>Country</label>
        <input type="text" name="country" value="IN" class="border p-2 w-full">
    </div>

    <div class="mb-3">
        <label>Rooms</label>
        <input type="number" name="rooms" class="border p-2 w-full">
    </div>

    <div class="mb-3">
        <label>Bathrooms</label>
        <input type="number" step="0.5" name="bathrooms" class="border p-2 w-full">
    </div>

    <div class="mb-3">
        <label>Comments</label>
        <textarea name="comments" class="border p-2 w-full"></textarea>
    </div>

    <button type="submit"
            class="bg-blue-600 text-white px-4 py-2 rounded">
        Save Property
    </button>

</form>
@endsection