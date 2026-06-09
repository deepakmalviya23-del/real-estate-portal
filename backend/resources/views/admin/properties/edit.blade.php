@extends('layouts.admin')

@section('content')
<x-app-layout>

<div class="max-w-4xl mx-auto bg-white shadow rounded-lg p-6 mt-6">

    <h2 class="text-2xl font-bold mb-6">
        Edit Property
    </h2>

    <form action="{{ route('properties.update',$property->id) }}"
          method="POST">

        @csrf
        @method('PUT')

        <input type="text"
               name="name"
               value="{{ $property->name }}"
               class="w-full border rounded p-2 mb-4">

        <input type="text"
               name="city"
               value="{{ $property->city }}"
               class="w-full border rounded p-2 mb-4">

        <button class="bg-blue-600 text-white px-4 py-2 rounded">
            Update Property
        </button>

    </form>

</div>

</x-app-layout>
@endsection