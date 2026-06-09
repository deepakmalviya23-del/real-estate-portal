@extends('layouts.admin')

@section('content')
<div class="max-w-7xl mx-auto p-6">

    <div class="flex justify-between items-center mb-6">
        <h1 class="text-3xl font-bold text-gray-800">Properties</h1>
        <a href="{{ route('properties.create') }}"
           class="bg-green-600 text-white px-4 py-2 rounded-lg font-medium hover:bg-green-700 transition shadow-sm">
            + Add Property
        </a>
    </div>

    <div class="bg-white shadow-sm rounded-xl border border-gray-200 overflow-hidden">
        <table class="w-full border-collapse">
            <thead class="bg-gray-50 border-b border-gray-200">
                <tr>
                    <th class="p-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Name</th>
                    <th class="p-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">City</th>
                    <th class="p-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Type</th>
                    <th class="p-4 text-left text-xs font-semibold text-gray-500 uppercase tracking-wider">Action</th>
                </tr>
            </thead>

            <tbody class="divide-y divide-gray-100">
                @foreach($properties as $property)
                <tr class="hover:bg-gray-50 transition">
                    <td class="p-4 text-sm text-gray-700 font-medium">
                        {{ $property->name }}
                    </td>
                    <td class="p-4 text-sm text-gray-600">
                        {{ $property->city }}
                    </td>
                    <td class="p-4 text-sm text-gray-600">
                        {{ $property->real_state_type }}
                    </td>
                    <td class="p-4 text-sm flex items-center space-x-2">
                        <a href="{{ route('properties.edit', $property) }}"
                           class="bg-amber-500 text-white px-3 py-1.5 rounded text-xs font-medium hover:bg-amber-600 transition shadow-sm">
                           Edit
                        </a>

                        <form action="/admin/properties/{{ $property->id }}" method="POST" onsubmit="return confirm('Are you sure you want to delete?');" class="inline-block">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="bg-red-500 text-white px-3 py-1.5 rounded text-xs font-medium hover:bg-red-600 transition shadow-sm">
                                Delete
                            </button>
                        </form>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>

        <div class="p-4 border-t border-gray-100 bg-gray-50">
            {{ $properties->links() }}
        </div>

    </div>
</div>
@endsection