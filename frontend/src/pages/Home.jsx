import { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import api from "../services/api";
import Navbar from "../components/Navbar";

export default function Home() {
  // 🟢 States for Form Inputs (Budget state removed)
  const [city, setCity] = useState("");
  const [type, setType] = useState("");
  
  // 🟢 States for Live Properties Data
  const [properties, setProperties] = useState([]);
  const [loading, setLoading] = useState(true);

  // 🟢 Function to fetch properties (Normal & Filtered)
  const fetchProperties = (searchCity = "", searchType = "") => {
    setLoading(true);
    
    // Query parameters build karna
    let url = `/properties?city=${searchCity}&type=${searchType}`;
    
    api.get(url)
      .then((res) => {
        setProperties(res.data.data || []);
        setLoading(false);
      })
      .catch((err) => {
        console.error("Error fetching properties:", err);
        setLoading(false);
      });
  };

  useEffect(() => {
    fetchProperties();
  }, []);

  const handleSearch = (e) => {
    e.preventDefault();
    fetchProperties(city, type);
  };

  return (
    <div className="bg-gray-50 min-h-screen">
      <Navbar />

      {/* 🌟 HERO SECTION */}
      <div className="bg-slate-900 text-white py-24 px-6 relative overflow-hidden">
        <div className="absolute top-0 right-0 w-96 h-96 bg-blue-500/10 rounded-full blur-3xl"></div>
        <div className="absolute bottom-0 left-0 w-96 h-96 bg-emerald-500/10 rounded-full blur-3xl"></div>

        <div className="max-w-6xl mx-auto text-center relative z-10">
          <h1 className="text-5xl md:text-6xl font-extrabold tracking-tight mb-6">
            Find Your <span className="text-emerald-400">Perfect</span> Dream Home
          </h1>
          <p className="text-lg md:text-xl text-slate-300 max-w-2xl mx-auto mb-10">
            Discover the best residential complexes, commercial spaces, and luxury apartments in your favorite cities.
          </p>

          {/* 🔍 LIVE SEARCH & FILTER BAR FORM (Now with 3 columns for perfect spacing) */}
          <form onSubmit={handleSearch} className="bg-white p-4 rounded-2xl shadow-xl max-w-3xl mx-auto text-gray-800 grid grid-cols-1 md:grid-cols-3 gap-4 items-center">
            
            {/* City Input */}
            <div className="flex flex-col text-left px-2">
              <label className="text-xs font-bold text-gray-400 uppercase">Location</label>
              <input 
                type="text" 
                placeholder="e.g. bhopal" 
                value={city}
                onChange={(e) => setCity(e.target.value)}
                className="w-full mt-1 text-sm font-medium focus:outline-none text-gray-700 bg-transparent"
              />
            </div>

            {/* Property Type Dropdown */}
            <div className="flex flex-col text-left px-2 border-t md:border-t-0 md:border-l border-gray-100 pt-2 md:pt-0">
              <label className="text-xs font-bold text-gray-400 uppercase">Property Type</label>
              <select 
                value={type}
                onChange={(e) => setType(e.target.value)}
                className="w-full mt-1 text-sm font-medium bg-transparent focus:outline-none text-gray-700 cursor-pointer"
              >
                <option value="">All Types</option>
                <option value="house">House</option>
                <option value="apartment">Apartment</option>
                <option value="commercial_ground">Commercial Ground</option>
              </select>
            </div>

            {/* Search Button */}
            <button type="submit" className="w-full bg-emerald-500 hover:bg-emerald-600 text-white font-semibold py-3 px-6 rounded-xl transition duration-200 shadow-md">
              Search
            </button>
          </form>
        </div>
      </div>

      {/* 🏢 LIVE PROPERTIES SECTION */}
      <div className="max-w-6xl mx-auto py-16 px-6">
        <div className="flex justify-between items-end mb-10">
          <div>
            <h2 className="text-3xl font-bold text-gray-800">Featured Properties</h2>
            <p className="text-gray-500 mt-1">Live updates straight from your database</p>
          </div>
          <Link to="/properties" className="text-emerald-600 font-semibold hover:text-emerald-700 transition flex items-center space-x-1">
            <span>View All</span>
            <span>&rarr;</span>
          </Link>
        </div>

        {/* Loading State */}
        {loading ? (
          <div className="text-center py-20 text-gray-500 text-lg font-medium animate-pulse">
            Searching properties...
          </div>
        ) : properties.length === 0 ? (
          <div className="text-center py-16 bg-amber-50 rounded-2xl p-6 border border-amber-100 text-amber-700 font-medium">
            No properties found matching your search filters. Try looking for another city or type!
          </div>
        ) : (
          /* Live Data Grid */
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {properties.map((property) => (
              <div key={property.id} className="bg-white rounded-2xl overflow-hidden shadow-sm hover:shadow-md border border-gray-100 transition duration-300 flex flex-col">
                
                {/* Image Placeholder */}
                <div className="h-48 bg-slate-100 relative flex items-center justify-center text-gray-400">
                  <span className="text-xs font-medium uppercase tracking-wider">Property Showcase</span>
                  <span className="absolute top-4 left-4 bg-emerald-500 text-white text-xs font-bold px-2.5 py-1 rounded-full uppercase">
                    For Sale
                  </span>
                </div>
                
                {/* Content */}
                <div className="p-5 flex-1 flex flex-col justify-between">
                  <div>
                    <h3 className="text-xl font-bold text-gray-800 mb-1 line-clamp-1">{property.name}</h3>
                    <p className="text-sm text-gray-500 mb-4 capitalize">{property.city}, {property.country}</p>
                    
                    <div className="flex items-center space-x-4 text-xs font-semibold text-gray-600 uppercase tracking-wider mb-4 bg-slate-50 p-2.5 rounded-lg">
                      <span className="capitalize">🏡 {property.real_state_type?.replace('_', ' ')}</span>
                    </div>
                  </div>

                  {/* Footer Action */}
                  <div className="flex justify-between items-center border-t pt-4">
                    <span className="text-xs text-gray-400 font-semibold">ID: #{property.id}</span>
                    <Link 
                      to={`/properties/${property.id}`} 
                      className="bg-slate-900 hover:bg-slate-800 text-white text-xs font-semibold px-4 py-2 rounded-lg transition"
                    >
                      View Details
                    </Link>
                  </div>
                </div>

              </div>
            ))}
          </div>
        )}
      </div>

      {/* 📞 CALL TO ACTION */}
      <div className="bg-emerald-50 py-16 px-6 border-t border-emerald-100">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-3xl font-bold text-gray-800 mb-4">Want to Sell or Rent Your Property?</h2>
          <p className="text-gray-600 mb-8 max-w-xl mx-auto">
            Post your property listing on our portal for free and connect with thousands of genuine buyers instantly.
          </p>
          <button className="bg-slate-900 hover:bg-slate-800 text-white font-semibold px-8 py-3 rounded-xl transition shadow-md">
            List Your Property
          </button>
        </div>
      </div>
    </div>
  );
}