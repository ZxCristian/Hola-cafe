import React from 'react';
import HolaLogo from './HolaLogo';

const Hero: React.FC = () => {
  return (
    <section className="relative bg-gradient-to-br from-hola-offwhite to-white py-12 px-3 sm:py-20 md:py-32 sm:px-4">
      <div className="max-w-6xl mx-auto text-center">
        <div className="mb-6 sm:mb-10 animate-fade-in">
          <HolaLogo size="xl" showTagline={true} />
        </div>
        <p className="text-lg sm:text-2xl md:text-3xl lg:text-4xl text-hola-gray mb-8 sm:mb-12 max-w-5xl mx-auto animate-slide-up font-futura leading-relaxed px-2 sm:px-4">
          Welcome to <span className="font-futura-bold text-hola-black">HOLA Café</span>, your go-to spot for a taste of everything delicious! Whether you're craving a budget-friendly treat from our <span className="font-futura-bold text-hola-black">₱38 Milktea</span> or <span className="font-futura-bold text-hola-black">₱38 Coffee</span> menus, or you want to indulge in a luxurious <span className="font-futura-bold text-hola-black">Premium Milktea</span> like the Brown Sugar or Matcha, we've got your perfect sip. Pair your drink with a delightful slice of our <span className="font-futura-bold text-hola-black">Cardinal Cakes</span> - from the classic Ube Cake to the decadent Red Velvet Cake. We're ready to serve you a happy moment, whether it's a creamy Frappe or a delicious piece of cake!
        </p>
        <div className="flex justify-center px-4">
          <a 
            href="#menu"
            className="bg-hola-black text-white px-8 py-3 sm:px-10 sm:py-4 text-base sm:text-lg md:text-xl rounded-full hover:bg-hola-gray transition-all duration-300 transform hover:scale-105 active:scale-95 font-futura-bold shadow-lg w-full sm:w-auto max-w-xs text-center"
          >
            Explore Menu
          </a>
        </div>
      </div>
    </section>
  );
};

export default Hero;