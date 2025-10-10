import React from 'react';
import { useCategories } from '../hooks/useCategories';

interface SubNavProps {
  selectedCategory: string;
  onCategoryClick: (categoryId: string) => void;
}

const SubNav: React.FC<SubNavProps> = ({ selectedCategory, onCategoryClick }) => {
  const { categories, loading } = useCategories();

  return (
    <div className="sticky top-16 z-40 bg-white/95 backdrop-blur-md border-b border-hola-lightgray">
      <div className="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
        <div className="flex items-center space-x-2 sm:space-x-4 overflow-x-auto py-3 scrollbar-hide snap-x snap-mandatory">
          {loading ? (
            <div className="flex space-x-2 sm:space-x-4">
              {[1,2,3,4,5].map(i => (
                <div key={i} className="h-8 w-20 bg-hola-lightgray rounded animate-pulse flex-shrink-0" />
              ))}
            </div>
          ) : (
            <>
              <button
                onClick={() => onCategoryClick('all')}
                className={`px-3 sm:px-4 py-2 rounded-full text-xs sm:text-sm font-futura-bold transition-colors duration-200 border whitespace-nowrap flex-shrink-0 snap-start ${
                  selectedCategory === 'all'
                    ? 'bg-hola-black text-white border-hola-black'
                    : 'bg-white text-hola-gray border-hola-lightgray hover:border-hola-black hover:text-hola-black'
                }`}
              >
                All
              </button>
              {categories.map((c) => (
                <button
                  key={c.id}
                  onClick={() => onCategoryClick(c.id)}
                  className={`px-3 sm:px-4 py-2 rounded-full text-xs sm:text-sm font-futura-bold transition-colors duration-200 border flex items-center space-x-1 sm:space-x-2 whitespace-nowrap flex-shrink-0 snap-start ${
                    selectedCategory === c.id
                      ? 'bg-hola-black text-white border-hola-black'
                      : 'bg-white text-hola-gray border-hola-lightgray hover:border-hola-black hover:text-hola-black'
                  }`}
                >
                  <span className="text-sm sm:text-base">{c.icon}</span>
                  <span>{c.name}</span>
                </button>
              ))}
            </>
          )}
        </div>
      </div>
    </div>
  );
};

export default SubNav;


