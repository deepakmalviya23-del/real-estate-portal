@extends('layouts.admin')

@section('content')

<h1 class="text-3xl font-bold mb-8">
    Dashboard
</h1>

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">

    <div class="bg-white rounded-lg shadow p-6">
        <h3 class="text-gray-500">Total Properties</h3>
        <p class="text-4xl font-bold mt-3">
            {{ $total }}
        </p>
    </div>

    <div class="bg-white rounded-lg shadow p-6">
        <h3 class="text-gray-500">Houses</h3>
        <p class="text-4xl font-bold mt-3">
            {{ $houses }}
        </p>
    </div>

    <div class="bg-white rounded-lg shadow p-6">
        <h3 class="text-gray-500">Departments</h3>
        <p class="text-4xl font-bold mt-3">
            {{ $departments }}
        </p>
    </div>

    <div class="bg-white rounded-lg shadow p-6">
        <h3 class="text-gray-500">Lands</h3>
        <p class="text-4xl font-bold mt-3">
            {{ $lands }}
        </p>
    </div>

</div>

@endsection