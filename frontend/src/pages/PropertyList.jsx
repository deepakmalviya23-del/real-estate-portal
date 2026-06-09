import { useEffect, useState } from "react";
import api from "../services/api";
import Navbar from "../components/Navbar";
import { Link } from "react-router-dom";

export default function PropertyList() {

 const [properties, setProperties] = useState([]);

 useEffect(() => {

  api.get("/properties")
     .then((res) => {
       setProperties(res.data.data);
     });

 }, []);

 return (
  <>
   <Navbar />

   <div className="container mx-auto py-10">

    <h2 className="text-3xl mb-5">
      Properties
    </h2>

    <div className="grid md:grid-cols-3 gap-6">

      {properties.map((item) => (

       <div
        key={item.id}
        className="border rounded p-4 shadow"
       >

        <h3 className="font-bold">
          {item.name}
        </h3>

        <p>{item.city}</p>

        <p>{item.country}</p>

        <Link
          to={`/properties/${item.id}`}
          className="text-blue-600"
        >
          View
        </Link>

       </div>

      ))}

    </div>

   </div>
  </>
 );
}