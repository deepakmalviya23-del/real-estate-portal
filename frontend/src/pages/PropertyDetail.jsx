import { useParams, Link } from "react-router-dom";
import { useEffect, useState } from "react";
import api from "../services/api";
import Navbar from "../components/Navbar";

export default function PropertyDetail() {
 const { id } = useParams();
 const [property, setProperty] = useState(null);
 const [loading, setLoading] = useState(true);

 useEffect(() => {
  api.get(`/properties/${id}`)
     .then((res) => {
        // Array check fallback ke sath safety lagayi hai
        const singleData = Array.isArray(res.data.data) ? res.data.data[0] : res.data.data;
        setProperty(singleData);
        setLoading(false);
     })
     .catch((err) => {
        console.error(err);
        setLoading(false);
     });
 }, [id]);

 if (loading) {
   return (
     <div className="flex justify-center items-center h-screen bg-gray-50">
       <div className="text-xl font-semibold text-slate-600 animate-pulse">Loading Details...</div>
     </div>
   );
 }

 if (!property) {
   return (
     <div className="text-center py-20 text-red-500 font-medium">
       Property not found or deleted!
     </div>
   );
 }

 return (
  <>
   <Navbar />

   <div className="max-w-4xl mx-auto py-10 px-6">
    {/* Back Button */}
    <Link to="/properties" className="text-sm text-blue-600 hover:underline inline-block mb-6">
       &larr; Back to Properties
    </Link>

    <div className="bg-white shadow-sm border border-gray-200 rounded-xl p-8">
      <h1 className="text-4xl font-bold text-gray-800 mb-6 border-b pb-4">
        {property.name}
      </h1>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6 text-gray-700">
        <div className="bg-slate-50 p-4 rounded-lg">
          <p className="text-xs text-gray-400 font-bold uppercase tracking-wider">Property Type</p>
          <p className="text-lg font-semibold text-slate-800 capitalize">{property.real_state_type?.replace('_', ' ')}</p>
        </div>

        <div className="bg-slate-50 p-4 rounded-lg">
          <p className="text-xs text-gray-400 font-bold uppercase tracking-wider">Location</p>
          <p className="text-lg font-semibold text-slate-800 capitalize">{property.city}, {property.country}</p>
        </div>

        <div className="bg-slate-50 p-4 rounded-lg">
          <p className="text-xs text-gray-400 font-bold uppercase tracking-wider">Rooms</p>
          <p className="text-lg font-semibold text-slate-800">{property.rooms ?? 'N/A'}</p>
        </div>

        <div className="bg-slate-50 p-4 rounded-lg">
          <p className="text-xs text-gray-400 font-bold uppercase tracking-wider">Bathrooms</p>
          <p className="text-lg font-semibold text-slate-800">{property.bathrooms ?? 'N/A'}</p>
        </div>
      </div>

      {property.comments && (
        <div className="mt-6 bg-amber-50 border border-amber-100 p-4 rounded-lg">
          <p className="text-xs text-amber-600 font-bold uppercase tracking-wider mb-1">Owner Comments</p>
          <p className="text-gray-700 italic">"{property.comments}"</p>
        </div>
      )}
    </div>
   </div>
  </>
 );
}