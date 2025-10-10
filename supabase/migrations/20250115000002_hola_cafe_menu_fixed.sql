/*
  # HOLA Café Menu Migration - Fixed Version
  
  This migration replaces all existing menu data with the HOLA café menu items.
  Uses a more robust approach to avoid subquery issues.
*/

-- Clear existing data first
DELETE FROM variations WHERE menu_item_id IN (SELECT id FROM menu_items);
DELETE FROM add_ons WHERE menu_item_id IN (SELECT id FROM menu_items);
DELETE FROM menu_items;
DELETE FROM categories;

-- Add new categories for HOLA Café
INSERT INTO categories (id, name, icon, sort_order, active) VALUES
  ('premium-milktea', 'Premium Milktea', '🧋', 1, true),
  ('frappe', 'Frappe', '🥤', 2, true),
  ('fresh-milk-latte', 'Fresh Milk Latte', '🥛', 3, true),
  ('cardinal-cakes', 'Cardinal Cakes', '🍰', 4, true),
  ('milktea-38', '₱38 Milktea', '🧋', 5, true),
  ('coffee-35', '₱35 Coffee', '☕', 6, true);

-- === PREMIUM MILKTEA ===
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Hola Classic', 'Our signature milk tea with the perfect balance of tea and cream', 79, 'premium-milktea', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Brown Sugar', 'Rich brown sugar milk tea with chewy pearls', 79, 'premium-milktea', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Chocolate', 'Decadent chocolate milk tea for chocolate lovers', 79, 'premium-milktea', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Oreo', 'Creamy milk tea with crushed Oreo cookies', 79, 'premium-milktea', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Nutella', 'Rich and creamy Nutella milk tea', 79, 'premium-milktea', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Red Velvet', 'Smooth red velvet milk tea with a hint of cocoa', 79, 'premium-milktea', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Taro', 'Purple taro milk tea with authentic taro flavor', 79, 'premium-milktea', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cheesy Mango', 'Sweet mango milk tea with cheesy foam', 79, 'premium-milktea', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Wintermelon', 'Refreshing wintermelon milk tea', 79, 'premium-milktea', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Okinawa', 'Traditional Okinawa brown sugar milk tea', 79, 'premium-milktea', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Hokkaido', 'Rich Hokkaido milk tea with premium milk', 79, 'premium-milktea', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Matcha', 'Authentic Japanese matcha milk tea', 79, 'premium-milktea', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- === FRAPPE (W/ WHIPPED CREAM) ===
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Chocolate Overload', 'Rich chocolate frappe topped with whipped cream and chocolate drizzle', 89, 'frappe', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Oreo Cream', 'Creamy Oreo frappe with crushed cookies and whipped cream', 89, 'frappe', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Ube Overload', 'Purple yam frappe with authentic ube flavor and whipped cream', 89, 'frappe', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Avocado Loco', 'Creamy avocado frappe with whipped cream topping', 89, 'frappe', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Nutella Bomb', 'Explosive Nutella frappe with whipped cream and hazelnut drizzle', 89, 'frappe', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Mango Cream', 'Fresh mango frappe with creamy whipped topping', 119, 'frappe', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- === FRESH MILK LATTE (ICED) ===
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Chocolate', 'Rich chocolate fresh milk latte served over ice', 89, 'fresh-milk-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cocoa Cream', 'Creamy cocoa fresh milk latte with smooth texture', 89, 'fresh-milk-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Matcha', 'Authentic Japanese matcha fresh milk latte', 89, 'fresh-milk-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Red Velvet', 'Smooth red velvet fresh milk latte', 89, 'fresh-milk-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Brown Sugar', 'Rich brown sugar fresh milk latte', 89, 'fresh-milk-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Strawberry Milk', 'Sweet strawberry fresh milk latte', 99, 'fresh-milk-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- === CARDINAL CAKES ===
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Custard Cake', 'Light and fluffy custard cake with smooth cream filling', 75, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Yema Cake', 'Traditional Filipino yema cake with sweet condensed milk', 80, 'cardinal-cakes', true, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Ube Cake', 'Purple yam cake with authentic ube flavor and cream', 85, 'cardinal-cakes', true, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Red Velvet Cake', 'Classic red velvet cake with cream cheese frosting', 95, 'cardinal-cakes', true, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Moist Chocolate Cake', 'Rich and moist chocolate cake with chocolate ganache', 85, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Strawberry Shortcake', 'Fresh strawberry shortcake with whipped cream', 150, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Coffee Caramel', 'Coffee-flavored cake with caramel drizzle', 90, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Boston Cream Pie', 'Classic Boston cream pie with custard filling', 125, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Mango Cream Cake', 'Fresh mango cream cake with tropical flavors', 150, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800');

-- === ₱38 MILKTEA ===
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Chocolate', 'Classic chocolate milk tea at an affordable price', 38, 'milktea-38', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cookies N Cream', 'Creamy cookies and cream milk tea', 38, 'milktea-38', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Hazelnut', 'Rich hazelnut flavored milk tea', 38, 'milktea-38', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Red Velvet', 'Smooth red velvet milk tea', 38, 'milktea-38', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Taro', 'Purple taro milk tea with authentic flavor', 38, 'milktea-38', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cheesy Mango', 'Sweet mango milk tea with cheesy foam', 38, 'milktea-38', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Wintermelon', 'Refreshing wintermelon milk tea', 38, 'milktea-38', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Matcha', 'Authentic Japanese matcha milk tea', 38, 'milktea-38', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- === ₱35 COFFEE ===
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Caramel Macchiato', 'Classic caramel macchiato with espresso and steamed milk', 35, 'coffee-35', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cafe Matcha', 'Green tea latte with authentic matcha powder', 35, 'coffee-35', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cafe Mocha', 'Rich chocolate mocha with espresso and cocoa', 35, 'coffee-35', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cafe Latte', 'Smooth espresso with steamed milk', 35, 'coffee-35', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Black Coffee', 'Pure black coffee for coffee purists', 35, 'coffee-35', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Now add variations using a more robust approach
-- Premium Milktea variations
INSERT INTO variations (menu_item_id, name, price)
SELECT mi.id, 'Regular', 0
FROM menu_items mi
WHERE mi.category = 'premium-milktea';

INSERT INTO variations (menu_item_id, name, price)
SELECT mi.id, 'Large', 10
FROM menu_items mi
WHERE mi.category = 'premium-milktea';

-- Frappe variations
INSERT INTO variations (menu_item_id, name, price)
SELECT mi.id, 'Regular', 0
FROM menu_items mi
WHERE mi.category = 'frappe';

INSERT INTO variations (menu_item_id, name, price)
SELECT mi.id, 'Large', 10
FROM menu_items mi
WHERE mi.category = 'frappe';

-- Cardinal Cakes variations
INSERT INTO variations (menu_item_id, name, price)
SELECT mi.id, 'Slice', 0
FROM menu_items mi
WHERE mi.category = 'cardinal-cakes';

-- Add whole cake prices based on the original pricing
INSERT INTO variations (menu_item_id, name, price)
SELECT mi.id, 'Whole', 
  CASE 
    WHEN mi.name = 'Custard Cake' THEN 475
    WHEN mi.name = 'Yema Cake' THEN 520
    WHEN mi.name = 'Ube Cake' THEN 565
    WHEN mi.name = 'Red Velvet Cake' THEN 655
    WHEN mi.name = 'Moist Chocolate Cake' THEN 565
    WHEN mi.name = 'Strawberry Shortcake' THEN 650
    WHEN mi.name = 'Coffee Caramel' THEN 610
    WHEN mi.name = 'Boston Cream Pie' THEN 825
    WHEN mi.name = 'Mango Cream Cake' THEN 650
    ELSE 500
  END
FROM menu_items mi
WHERE mi.category = 'cardinal-cakes';

-- Add some popular add-ons for drinks
INSERT INTO add_ons (menu_item_id, name, price, category)
SELECT mi.id, 'Extra Pearls', 15, 'extras'
FROM menu_items mi
WHERE mi.name = 'Hola Classic' AND mi.category = 'premium-milktea';

INSERT INTO add_ons (menu_item_id, name, price, category)
SELECT mi.id, 'Extra Cream', 10, 'extras'
FROM menu_items mi
WHERE mi.name = 'Hola Classic' AND mi.category = 'premium-milktea';

INSERT INTO add_ons (menu_item_id, name, price, category)
SELECT mi.id, 'Extra Pearls', 15, 'extras'
FROM menu_items mi
WHERE mi.name = 'Brown Sugar' AND mi.category = 'premium-milktea';

INSERT INTO add_ons (menu_item_id, name, price, category)
SELECT mi.id, 'Extra Brown Sugar', 10, 'extras'
FROM menu_items mi
WHERE mi.name = 'Brown Sugar' AND mi.category = 'premium-milktea';

INSERT INTO add_ons (menu_item_id, name, price, category)
SELECT mi.id, 'Extra Oreo', 15, 'extras'
FROM menu_items mi
WHERE mi.name = 'Oreo' AND mi.category = 'premium-milktea';

INSERT INTO add_ons (menu_item_id, name, price, category)
SELECT mi.id, 'Extra Taro', 10, 'extras'
FROM menu_items mi
WHERE mi.name = 'Taro' AND mi.category = 'premium-milktea';

INSERT INTO add_ons (menu_item_id, name, price, category)
SELECT mi.id, 'Extra Matcha', 15, 'extras'
FROM menu_items mi
WHERE mi.name = 'Matcha' AND mi.category = 'premium-milktea';

INSERT INTO add_ons (menu_item_id, name, price, category)
SELECT mi.id, 'Extra Chocolate', 15, 'extras'
FROM menu_items mi
WHERE mi.name = 'Chocolate Overload' AND mi.category = 'frappe';

INSERT INTO add_ons (menu_item_id, name, price, category)
SELECT mi.id, 'Extra Oreo', 15, 'extras'
FROM menu_items mi
WHERE mi.name = 'Oreo Cream' AND mi.category = 'frappe';

INSERT INTO add_ons (menu_item_id, name, price, category)
SELECT mi.id, 'Extra Mango', 20, 'extras'
FROM menu_items mi
WHERE mi.name = 'Mango Cream' AND mi.category = 'frappe';
