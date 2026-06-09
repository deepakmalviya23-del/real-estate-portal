import { Link } from "react-router-dom";

export default function Navbar() {
  return (
    <nav className="bg-slate-900 text-white p-4 shadow-md">
      {/* 🟢 justify-between aur items-center add kiya hai */}
      <div className="container mx-auto flex justify-between items-center">
        
        {/* Brand / Logo (Left Side) */}
        <Link to="/" className="text-xl font-bold tracking-wide hover:text-slate-300 transition">
          Real Estate
        </Link>

        {/* Navigation Menu Links (Right Side) */}
        {/* 🟢 space-x-6 se menu items ke beech me barabar gap aayega */}
        <div className="flex space-x-6 font-medium">
          <Link to="/properties" className="hover:text-slate-300 transition">
            Properties
          </Link>
        </div>

      </div>
    </nav>
  );
}