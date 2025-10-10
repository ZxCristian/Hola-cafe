import React from 'react';

interface HolaLogoProps {
  className?: string;
  size?: 'sm' | 'md' | 'lg' | 'xl';
  showTagline?: boolean;
}

const HolaLogo: React.FC<HolaLogoProps> = ({ 
  className = '', 
  size = 'md',
  showTagline = true 
}) => {
  const sizeClasses = {
    sm: {
      title: 'text-lg',
      tagline: 'text-xs',
      spacing: 'space-y-1'
    },
    md: {
      title: 'text-2xl',
      tagline: 'text-sm',
      spacing: 'space-y-1'
    },
    lg: {
      title: 'text-4xl',
      tagline: 'text-base',
      spacing: 'space-y-2'
    },
    xl: {
      title: 'text-6xl',
      tagline: 'text-lg',
      spacing: 'space-y-3'
    }
  };

  const currentSize = sizeClasses[size];

  return (
    <div className={`flex flex-col items-center ${currentSize.spacing} ${className}`}>
      <div className={`font-futura-bold font-bold text-hola-black ${currentSize.title} tracking-wide`}>
        hola café
      </div>
      {showTagline && (
        <div className={`font-futura font-medium text-hola-gray uppercase tracking-wider ${currentSize.tagline}`}>
          YOUR NEIGHBORHOOD CAFE
        </div>
      )}
    </div>
  );
};

export default HolaLogo;
