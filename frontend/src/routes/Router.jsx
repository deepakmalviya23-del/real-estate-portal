import {
 BrowserRouter,
 Routes,
 Route
} from "react-router-dom";

import Home from "../pages/Home";
import PropertyList from "../pages/PropertyList";
import PropertyDetail from "../pages/PropertyDetail";

export default function Router() {
 return (
  <BrowserRouter>

   <Routes>

    <Route
      path="/"
      element={<Home />}
    />

    <Route
      path="/properties"
      element={<PropertyList />}
    />

    <Route
      path="/properties/:id"
      element={<PropertyDetail />}
    />

   </Routes>

  </BrowserRouter>
 );
}