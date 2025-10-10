import React from 'react';
import { Trash2, Plus, Minus, ArrowLeft } from 'lucide-react';
import { CartItem } from '../types';

interface CartProps {
  cartItems: CartItem[];
  updateQuantity: (id: string, quantity: number) => void;
  removeFromCart: (id: string) => void;
  clearCart: () => void;
  getTotalPrice: () => number;
  onContinueShopping: () => void;
  onCheckout: () => void;
}

const Cart: React.FC<CartProps> = ({
  cartItems,
  updateQuantity,
  removeFromCart,
  clearCart,
  getTotalPrice,
  onContinueShopping,
  onCheckout
}) => {
  if (cartItems.length === 0) {
    return (
      <div className="max-w-4xl mx-auto px-4 py-12">
        <div className="text-center py-16">
          <div className="text-6xl mb-4">☕</div>
          <h2 className="text-2xl font-futura-bold font-bold text-hola-black mb-2">Your cart is empty</h2>
          <p className="text-hola-gray mb-6 font-futura">Add some delicious items to get started!</p>
          <button
            onClick={onContinueShopping}
            className="bg-hola-black text-white px-6 py-3 rounded-full hover:bg-hola-gray transition-all duration-200 font-futura-bold"
          >
            Browse Menu
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center justify-between mb-8">
        <button
          onClick={onContinueShopping}
          className="flex items-center space-x-2 text-hola-gray hover:text-hola-black transition-colors duration-200 font-futura"
        >
          <ArrowLeft className="h-5 w-5" />
          <span>Continue Shopping</span>
        </button>
        <h1 className="text-3xl font-futura-bold font-bold text-hola-black">Your Cart</h1>
        <button
          onClick={clearCart}
          className="text-hola-gray hover:text-hola-black transition-colors duration-200 font-futura"
        >
          Clear All
        </button>
      </div>

      <div className="bg-white rounded-xl shadow-sm overflow-hidden mb-8">
        {cartItems.map((item, index) => (
          <div key={item.id} className={`p-6 ${index !== cartItems.length - 1 ? 'border-b border-hola-lightgray' : ''}`}>
            <div className="flex items-center justify-between">
              <div className="flex-1">
                <h3 className="text-lg font-futura-bold font-bold text-hola-black mb-1">{item.name}</h3>
                {item.selectedVariation && (
                  <p className="text-sm text-hola-gray mb-1 font-futura">Size: {item.selectedVariation.name}</p>
                )}
                {item.selectedAddOns && item.selectedAddOns.length > 0 && (
                  <p className="text-sm text-hola-gray mb-1 font-futura">
                    Add-ons: {item.selectedAddOns.map(addOn => 
                      addOn.quantity && addOn.quantity > 1 
                        ? `${addOn.name} x${addOn.quantity}`
                        : addOn.name
                    ).join(', ')}
                  </p>
                )}
                <p className="text-lg font-futura-bold font-bold text-hola-black">₱{item.totalPrice} each</p>
              </div>
              
              <div className="flex items-center space-x-4 ml-4">
                <div className="flex items-center space-x-3 bg-hola-cream rounded-full p-1">
                  <button
                    onClick={() => updateQuantity(item.id, item.quantity - 1)}
                    className="p-2 hover:bg-hola-lightgray rounded-full transition-colors duration-200"
                  >
                    <Minus className="h-4 w-4 text-hola-black" />
                  </button>
                  <span className="font-futura-bold font-bold text-hola-black min-w-[32px] text-center">{item.quantity}</span>
                  <button
                    onClick={() => updateQuantity(item.id, item.quantity + 1)}
                    className="p-2 hover:bg-hola-lightgray rounded-full transition-colors duration-200"
                  >
                    <Plus className="h-4 w-4 text-hola-black" />
                  </button>
                </div>
                
                <div className="text-right">
                  <p className="text-lg font-futura-bold font-bold text-hola-black">₱{item.totalPrice * item.quantity}</p>
                </div>
                
                <button
                  onClick={() => removeFromCart(item.id)}
                  className="p-2 text-hola-gray hover:text-hola-black hover:bg-hola-cream rounded-full transition-all duration-200"
                >
                  <Trash2 className="h-4 w-4" />
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>

      <div className="bg-white rounded-xl shadow-sm p-6">
        <div className="flex items-center justify-between text-2xl font-futura-bold font-bold text-hola-black mb-6">
          <span>Total:</span>
          <span>₱{parseFloat(getTotalPrice() || 0).toFixed(2)}</span>
        </div>
        
        <button
          onClick={onCheckout}
          className="w-full bg-hola-black text-white py-4 rounded-xl hover:bg-hola-gray transition-all duration-200 transform hover:scale-[1.02] font-futura-bold text-lg"
        >
          Proceed to Checkout
        </button>
      </div>
    </div>
  );
};

export default Cart;