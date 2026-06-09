<!DOCTYPE html>
<html lang="en">
<head>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body class="bg-gray-100">

<div class="flex min-h-screen">

    <!-- Sidebar -->
    <div class="w-64 bg-slate-900 text-white">

        <div class="p-5 text-xl font-bold border-b border-slate-700">
            Real Estate
        </div>

        <nav class="p-4 space-y-2">

            <a href="/dashboard"
               class="block px-4 py-3 rounded hover:bg-slate-700">
                Dashboard
            </a>

            <a href="/admin/properties"
               class="block px-4 py-3 rounded hover:bg-slate-700">
                Properties
            </a>

        </nav>

    </div>

    <!-- Content -->
    <div class="flex-1 p-8">

        @yield('content')

    </div>

</div>

</body>
</html>