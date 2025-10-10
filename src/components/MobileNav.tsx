import React from 'react';
import { useCategories } from '../hooks/useCategories';

interface MobileNavProps {
  activeCategory: string;
  onCategoryClick: (categoryId: string) => void;
}

const MobileNav: React.FC<MobileNavProps> = ({ activeCategory, onCategoryClick }) => {
  const { categories } = useCategories();

  return (
    <div className="sticky top-14 sm:top-16 z-40 bg-white/95 backdrop-blur-md border-b border-hola-lightgray md:hidden shadow-sm">
      <div className="flex overflow-x-auto scrollbar-hide px-3 py-3 space-x-2 snap-x snap-mandatory">
        {categories.map((category) => (
          <button
            key={category.id}
            onClick={() => onCategoryClick(category.id)}
            className={`flex-shrink-0 flex items-center space-x-1.5 px-3 py-2 rounded-full transition-all duration-200 border snap-start ${
              activeCategory === category.id
                ? 'bg-hola-black text-white border-hola-black'
                : 'bg-white text-hola-gray border-hola-lightgray hover:border-hola-black hover:text-hola-black active:scale-95'
            }`}
          >
            <span className="text-base">{category.icon}</span>
            <span className="text-xs font-futura-bold whitespace-nowrap">{category.name}</span>
          </button>
        ))}
      </div>
    </div>
  );
};

export default MobileNav;