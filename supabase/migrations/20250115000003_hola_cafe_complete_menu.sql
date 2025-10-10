/*
  # HOLA Café Complete Menu Migration
  
  This migration replaces all existing menu data with the complete HOLA café menu.
  
  Categories:
  - all-day-breakfast: Breakfast items served all day
  - food-snacks: Food items and snacks
  - cardinal-cakes: Cake slices
  - coffee-latte: Coffee and latte drinks
  - milktea-frappe-shakes: Milk tea, frappe, and shake drinks
  - fresh-juice: Fresh juice drinks
  
  Features:
  - Hot/Iced variations for drinks
  - Proper pricing structure
  - High-quality café images
  - Popular items marked appropriately
*/

-- Clear existing data first
DELETE FROM variations WHERE menu_item_id IN (SELECT id FROM menu_items);
DELETE FROM add_ons WHERE menu_item_id IN (SELECT id FROM menu_items);
DELETE FROM menu_items;
DELETE FROM categories;

-- Add new categories for HOLA Café
INSERT INTO categories (id, name, icon, sort_order, active) VALUES
  ('all-day-breakfast', 'All-Day Breakfast', '🍳', 1, true),
  ('food-snacks', 'Food & Snacks', '🍔', 2, true),
  ('cardinal-cakes', 'Cardinal Cakes', '🍰', 3, true),
  ('coffee-latte', 'Coffee & Latte', '☕', 4, true),
  ('milktea-frappe-shakes', 'Milktea, Frappe & Shakes', '🧋', 5, true),
  ('fresh-juice', 'Fresh Juice', '🍹', 6, true);

-- === ALL-DAY BREAKFAST ===
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Corned Beef & Egg', 'Classic corned beef with sunny-side up egg', 79, 'all-day-breakfast', false, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Longganisa & Egg', 'Filipino longganisa with fried egg', 79, 'all-day-breakfast', true, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Ham & Egg', 'Sliced ham with sunny-side up egg', 79, 'all-day-breakfast', false, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Sisig & Egg', 'Spicy sisig with fried egg', 89, 'all-day-breakfast', true, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Tuna & Egg', 'Tuna flakes with sunny-side up egg', 99, 'all-day-breakfast', false, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Tocino & Egg', 'Sweet tocino with fried egg', 99, 'all-day-breakfast', true, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Spam & Egg', 'Classic spam with sunny-side up egg', 99, 'all-day-breakfast', false, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Classic Waffle', 'Golden waffle with butter and syrup', 99, 'all-day-breakfast', false, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Fried Chicken & Egg', 'Crispy fried chicken with fried egg', 109, 'all-day-breakfast', true, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Spicy Korean Beef & Egg', 'Spicy Korean-style beef with fried egg', 109, 'all-day-breakfast', false, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Porkchop & Egg', 'Grilled pork chop with sunny-side up egg', 109, 'all-day-breakfast', false, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Bangus', 'Fried milkfish with garlic rice', 109, 'all-day-breakfast', true, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Bacon & Egg', 'Crispy bacon with sunny-side up egg', 109, 'all-day-breakfast', true, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Banana Caramel Waffle', 'Waffle topped with banana and caramel', 109, 'all-day-breakfast', false, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800');

-- === FOOD & SNACKS ===
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Burger (B1T1)', 'Buy 1 Take 1 burger deal', 20, 'food-snacks', true, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('French Fries', 'Crispy golden french fries', 40, 'food-snacks', false, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Special Halo-Halo', 'Traditional Filipino dessert with mixed ingredients', 70, 'food-snacks', true, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Clubhouse Sandwich', 'Triple-decker sandwich with ham, turkey, and bacon', 85, 'food-snacks', false, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Ham & Cheese Sandwich', 'Classic ham and cheese sandwich', 85, 'food-snacks', false, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Carbonara', 'Creamy carbonara pasta', 90, 'food-snacks', true, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cheese Ramen', 'Cheesy ramen noodles', 99, 'food-snacks', false, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Korean Noodles/Ramyun', 'Spicy Korean ramyun noodles', 99, 'food-snacks', true, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('8" Pizza', '8-inch pizza with your choice of toppings', 150, 'food-snacks', false, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Add French Fries variations
INSERT INTO variations (menu_item_id, name, price)
SELECT mi.id, 'Plain', 0
FROM menu_items mi
WHERE mi.name = 'French Fries' AND mi.category = 'food-snacks';

INSERT INTO variations (menu_item_id, name, price)
SELECT mi.id, 'Cheese', 0
FROM menu_items mi
WHERE mi.name = 'French Fries' AND mi.category = 'food-snacks';

INSERT INTO variations (menu_item_id, name, price)
SELECT mi.id, 'BBQ', 0
FROM menu_items mi
WHERE mi.name = 'French Fries' AND mi.category = 'food-snacks';

INSERT INTO variations (menu_item_id, name, price)
SELECT mi.id, 'Sour Cream', 0
FROM menu_items mi
WHERE mi.name = 'French Fries' AND mi.category = 'food-snacks';

-- === CARDINAL CAKES (SLICE PRICES) ===
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Custard Cake', 'Light and fluffy custard cake with smooth cream filling', 80, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Yema Cake', 'Traditional Filipino yema cake with sweet condensed milk', 85, 'cardinal-cakes', true, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Ube Cake', 'Purple yam cake with authentic ube flavor and cream', 90, 'cardinal-cakes', true, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Moist Chocolate Cake', 'Rich and moist chocolate cake with chocolate ganache', 90, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Coffee Caramel', 'Coffee-flavored cake with caramel drizzle', 95, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Red Velvet Cake', 'Classic red velvet cake with cream cheese frosting', 100, 'cardinal-cakes', true, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Strawberry Shortcake', 'Fresh strawberry shortcake with whipped cream', 110, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Mango Cream Cake', 'Fresh mango cream cake with tropical flavors', 110, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Boston Cream Pie', 'Classic Boston cream pie with custard filling', 125, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800');

-- === COFFEE & LATTE DRINKS ===
-- Coffee (Hot/Iced)
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Americano', 'Classic Americano coffee', 69, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cafe Latte', 'Smooth espresso with steamed milk', 79, 'coffee-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Spanish Latte', 'Rich Spanish-style latte', 79, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Vietnamese Latte', 'Traditional Vietnamese coffee with condensed milk', 79, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Mocha Latte', 'Rich chocolate mocha with espresso and cocoa', 89, 'coffee-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Caramel Macchiato', 'Classic caramel macchiato with espresso and steamed milk', 89, 'coffee-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Latte (Hot/Iced)
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Chocolate Latte', 'Rich chocolate latte', 89, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Matcha Latte', 'Authentic Japanese matcha latte', 89, 'coffee-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Red Velvet Latte', 'Smooth red velvet latte', 89, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Strawberry Milk Latte', 'Sweet strawberry milk latte', 99, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- ₱38 Coffee
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('₱38 Caramel Macchiato', 'Budget-friendly caramel macchiato', 38, 'coffee-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('₱38 Cafe Matcha', 'Budget-friendly matcha latte', 38, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('₱38 Cafe Mocha', 'Budget-friendly mocha latte', 38, 'coffee-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('₱38 Black Coffee', 'Budget-friendly black coffee', 38, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('₱38 Cafe Latte', 'Budget-friendly cafe latte', 38, 'coffee-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('₱35 Spanish Latte', 'Budget-friendly Spanish latte', 35, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Add Hot/Iced variations for coffee and latte drinks
INSERT INTO variations (menu_item_id, name, price)
SELECT mi.id, 'Hot', 0
FROM menu_items mi
WHERE mi.category = 'coffee-latte' AND mi.base_price >= 69;

INSERT INTO variations (menu_item_id, name, price)
SELECT mi.id, 'Iced', 0
FROM menu_items mi
WHERE mi.category = 'coffee-latte' AND mi.base_price >= 69;

-- === MILK TEA, FRAPPE & SHAKES ===
-- Premium Milk Tea (₱79)
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Hola Classic', 'Our signature milk tea with the perfect balance of tea and cream', 79, 'milktea-frappe-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Chocolate Milk Tea', 'Decadent chocolate milk tea for chocolate lovers', 79, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Oreo Milk Tea', 'Creamy milk tea with crushed Oreo cookies', 79, 'milktea-frappe-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Nutella Milk Tea', 'Rich and creamy Nutella milk tea', 79, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Red Velvet Milk Tea', 'Smooth red velvet milk tea with a hint of cocoa', 79, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Taro Milk Tea', 'Purple taro milk tea with authentic taro flavor', 79, 'milktea-frappe-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cheesy Mango Milk Tea', 'Sweet mango milk tea with cheesy foam', 79, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Wintermelon Milk Tea', 'Refreshing wintermelon milk tea', 79, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Matcha Milk Tea', 'Authentic Japanese matcha milk tea', 79, 'milktea-frappe-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- ₱38 Milktea
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('₱38 Chocolate Milk Tea', 'Classic chocolate milk tea at an affordable price', 38, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('₱38 Cookies N Cream', 'Creamy cookies and cream milk tea', 38, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('₱38 Hazelnut', 'Rich hazelnut flavored milk tea', 38, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('₱38 Red Velvet', 'Smooth red velvet milk tea', 38, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('₱38 Taro', 'Purple taro milk tea with authentic flavor', 38, 'milktea-frappe-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('₱38 Cheesy Mango', 'Sweet mango milk tea with cheesy foam', 38, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('₱38 Wintermelon', 'Refreshing wintermelon milk tea', 38, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('₱38 Matcha', 'Authentic Japanese matcha milk tea', 38, 'milktea-frappe-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Frappe
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Chocolate Overload Frappe', 'Rich chocolate frappe topped with whipped cream and chocolate drizzle', 109, 'milktea-frappe-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Oreo Cream Frappe', 'Creamy Oreo frappe with crushed cookies and whipped cream', 109, 'milktea-frappe-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Ube Overload Frappe', 'Purple yam frappe with authentic ube flavor and whipped cream', 109, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Avocado Loco Frappe', 'Creamy avocado frappe with whipped cream topping', 109, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Nutella Bomb Frappe', 'Explosive Nutella frappe with whipped cream and hazelnut drizzle', 109, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Mango Cream Frappe', 'Fresh mango frappe with creamy whipped topping', 129, 'milktea-frappe-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Cream Shake (₱79)
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Matcha Cream Shake', 'Creamy matcha shake', 79, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Strawberry Cream Shake', 'Sweet strawberry cream shake', 79, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Red Velvet Cream Shake', 'Smooth red velvet cream shake', 79, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Fresh Fruit Shake (₱69)
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Mango Shake', 'Fresh mango fruit shake', 69, 'milktea-frappe-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Mango Graham Shake', 'Mango shake with graham crackers', 69, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Banana Shake', 'Fresh banana fruit shake', 69, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Banana Mango Shake', 'Combined banana and mango shake', 69, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Chocolate Shake (₱50)
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Choco Kisses Shake', 'Chocolate shake with Hershey\'s kisses', 50, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Choco Mousse Shake', 'Rich chocolate mousse shake', 50, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Double Dutch Shake', 'Double chocolate Dutch shake', 50, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Dark Choco Shake', 'Intense dark chocolate shake', 50, 'milktea-frappe-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- === FRESH JUICE ===
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url) VALUES
  ('Lemonade', 'Fresh lemonade', 89, 'fresh-juice', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Blue Lemonade', 'Blue-colored lemonade', 89, 'fresh-juice', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Iced Lemon Tea', 'Refreshing iced lemon tea', 89, 'fresh-juice', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('Cucumber Lemonade', 'Fresh cucumber lemonade', 89, 'fresh-juice', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');
