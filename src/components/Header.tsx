import React from 'react';
import { ShoppingCart } from 'lucide-react';
import { useSiteSettings } from '../hooks/useSiteSettings';
import HolaLogo from './HolaLogo';

interface HeaderProps {
  cartItemsCount: number;
  onCartClick: () => void;
  onMenuClick: () => void;
}

const Header: React.FC<HeaderProps> = ({ cartItemsCount, onCartClick, onMenuClick }) => {
  const { siteSettings, loading } = useSiteSettings();

  return (
    <header className="sticky top-0 z-50 bg-white/95 backdrop-blur-md border-b border-hola-lightgray shadow-sm">
      <div className="max-w-7xl mx-auto px-3 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-14 sm:h-16">
          <button 
            onClick={onMenuClick}
            className="flex items-center space-x-2 sm:space-x-3 text-hola-black hover:text-hola-gray transition-colors duration-200 active:scale-95 transform"
          >
            {loading ? (
              <div className="w-24 sm:w-32 h-6 sm:h-8 bg-hola-lightgray rounded animate-pulse" />
            ) : (
              <HolaLogo size="md" showTagline={false} />
            )}
          </button>

          <div className="flex items-center space-x-1 sm:space-x-2">
            <button 
              onClick={onCartClick}
              className="relative p-2 sm:p-2 text-hola-gray hover:text-hola-black hover:bg-hola-cream rounded-full transition-all duration-200 active:scale-95 transform"
            >
              <ShoppingCart className="h-5 w-5 sm:h-6 sm:w-6" />
              {cartItemsCount > 0 && (
                <span className="absolute -top-1 -right-1 bg-hola-black text-white text-xs rounded-full h-5 w-5 flex items-center justify-center animate-bounce-gentle font-futura-bold">
                  {cartItemsCount}
                </span>
              )}
            </button>
          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;