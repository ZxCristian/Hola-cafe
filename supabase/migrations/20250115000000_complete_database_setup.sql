/*
  # Complete HOLA Café Database Setup
  
  This migration creates all necessary tables and inserts the complete menu data.
  
  ## Tables Created:
  1. categories - Menu categories
  2. menu_items - Menu items with pricing
  3. variations - Size/flavor variations for menu items
  4. add_ons - Optional add-ons for menu items
  5. payment_methods - Payment methods
  6. site_settings - Site configuration
  
  ## Security:
  - Enable RLS on all tables
  - Public read access for menu data
  - Admin-only write access
*/

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Drop existing tables if they exist (in correct order due to foreign keys)
DROP TABLE IF EXISTS add_ons CASCADE;
DROP TABLE IF EXISTS variations CASCADE;
DROP TABLE IF EXISTS menu_items CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS payment_methods CASCADE;
DROP TABLE IF EXISTS site_settings CASCADE;

-- Create categories table
CREATE TABLE categories (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  icon TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create menu_items table
CREATE TABLE menu_items (
  id TEXT PRIMARY KEY DEFAULT uuid_generate_v4()::TEXT,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  base_price DECIMAL(10,2) NOT NULL,
  category TEXT NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  popular BOOLEAN DEFAULT false,
  available BOOLEAN DEFAULT true,
  image_url TEXT,
  discount_price DECIMAL(10,2),
  discount_start_date TIMESTAMPTZ,
  discount_end_date TIMESTAMPTZ,
  discount_active BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create variations table
CREATE TABLE variations (
  id TEXT PRIMARY KEY DEFAULT uuid_generate_v4()::TEXT,
  menu_item_id TEXT NOT NULL REFERENCES menu_items(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create add_ons table
CREATE TABLE add_ons (
  id TEXT PRIMARY KEY DEFAULT uuid_generate_v4()::TEXT,
  menu_item_id TEXT NOT NULL REFERENCES menu_items(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  category TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create payment_methods table
CREATE TABLE payment_methods (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  account_number TEXT NOT NULL,
  account_name TEXT NOT NULL,
  qr_code_url TEXT NOT NULL,
  active BOOLEAN DEFAULT true,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create site_settings table
CREATE TABLE site_settings (
  id TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  type TEXT DEFAULT 'string',
  description TEXT,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE menu_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE variations ENABLE ROW LEVEL SECURITY;
ALTER TABLE add_ons ENABLE ROW LEVEL SECURITY;
ALTER TABLE payment_methods ENABLE ROW LEVEL SECURITY;
ALTER TABLE site_settings ENABLE ROW LEVEL SECURITY;

-- Create policies for public read access
CREATE POLICY "Public can read categories" ON categories FOR SELECT USING (true);
CREATE POLICY "Public can read menu_items" ON menu_items FOR SELECT USING (true);
CREATE POLICY "Public can read variations" ON variations FOR SELECT USING (true);
CREATE POLICY "Public can read add_ons" ON add_ons FOR SELECT USING (true);
CREATE POLICY "Public can read payment_methods" ON payment_methods FOR SELECT USING (active = true);
CREATE POLICY "Public can read site_settings" ON site_settings FOR SELECT USING (true);

-- Create indexes for better performance
CREATE INDEX idx_menu_items_category ON menu_items(category);
CREATE INDEX idx_menu_items_popular ON menu_items(popular);
CREATE INDEX idx_menu_items_available ON menu_items(available);
CREATE INDEX idx_variations_menu_item ON variations(menu_item_id);
CREATE INDEX idx_add_ons_menu_item ON add_ons(menu_item_id);

-- ============================================================================
-- INSERT DATA
-- ============================================================================

-- Insert categories for HOLA Café
INSERT INTO categories (id, name, icon, sort_order, active) VALUES
  ('all-day-breakfast', 'All-Day Breakfast', '🍳', 1, true),
  ('food-snacks', 'Food & Snacks', '🍔', 2, true),
  ('cardinal-cakes', 'Cardinal Cakes', '🍰', 3, true),
  ('coffee-latte', 'Coffee & Latte', '☕', 4, true),
  ('milktea-shakes', 'Milktea & Shakes', '🧋', 5, true);

-- === ALL-DAY BREAKFAST ===
INSERT INTO menu_items (id, name, description, base_price, category, popular, available, image_url) VALUES
  ('breakfast-corned-beef', 'Corned Beef', 'Classic corned beef with sunny-side up egg and garlic rice', 79, 'all-day-breakfast', false, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('breakfast-longganisa', 'Longganisa', 'Filipino longganisa with fried egg and garlic rice', 79, 'all-day-breakfast', true, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('breakfast-ham', 'Ham', 'Sliced ham with sunny-side up egg and garlic rice', 79, 'all-day-breakfast', false, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('breakfast-sisig', 'Sisig', 'Spicy sisig with fried egg and garlic rice', 89, 'all-day-breakfast', true, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('breakfast-tuna', 'Tuna', 'Tuna flakes with sunny-side up egg and garlic rice', 99, 'all-day-breakfast', false, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('breakfast-tocino', 'Tocino', 'Sweet tocino with fried egg and garlic rice', 99, 'all-day-breakfast', true, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('breakfast-spam', 'Spam', 'Classic spam with sunny-side up egg and garlic rice', 99, 'all-day-breakfast', false, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('breakfast-korean-beef', 'Korean Beef', 'Spicy Korean-style beef with fried egg and garlic rice', 109, 'all-day-breakfast', false, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('breakfast-pork-chop', 'Pork Chop', 'Grilled pork chop with sunny-side up egg and garlic rice', 109, 'all-day-breakfast', false, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('breakfast-fried-chicken', 'Fried Chicken', 'Crispy fried chicken with fried egg and garlic rice', 109, 'all-day-breakfast', true, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('breakfast-bangus', 'Bangus', 'Fried milkfish with garlic rice and egg', 109, 'all-day-breakfast', true, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('breakfast-bacon', 'Bacon', 'Crispy bacon with sunny-side up egg and garlic rice', 109, 'all-day-breakfast', true, true, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=800');

-- === FOOD & SNACKS ===
INSERT INTO menu_items (id, name, description, base_price, category, popular, available, image_url) VALUES
  ('food-halo-halo', 'Special Halo-Halo', 'Creamy flavored ice halo-halo with mixed ingredients', 70, 'food-snacks', true, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('food-french-fries', 'French Fries', 'Crispy golden french fries with your choice of flavor', 40, 'food-snacks', false, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('food-sandwiches', 'Sandwiches', 'Fresh sandwiches with your choice of filling', 85, 'food-snacks', false, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('food-carbonara', 'Carbonara', 'Creamy and cheesy carbonara pasta', 90, 'food-snacks', true, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('food-korean-ramen', 'Korean Ramen', 'Spicy Korean ramyun noodles with toppings', 99, 'food-snacks', true, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('food-waffle-classic', 'Classic Waffle', 'Plain waffle with your choice of syrup', 99, 'food-snacks', false, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('food-waffle-banana', 'Banana Caramel Waffle', 'Plain waffle with caramel sauce and banana slices', 109, 'food-snacks', false, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('food-waffle-trio', 'Waffle Trio', 'Plain waffle with fried chicken and french fries', 199, 'food-snacks', false, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('food-pizza', '8" Pizza', 'Filipino classic Hawaiian pizza', 150, 'food-snacks', false, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('food-burger', 'Burger (B1T1)', 'Buy 1 Take 1 burger deal', 60, 'food-snacks', true, true, 'https://images.pexels.com/photos/1639565/pexels-photo-1639565.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Add French Fries variations
INSERT INTO variations (menu_item_id, name, price) VALUES
  ('food-french-fries', 'Regular - Plain', 0),
  ('food-french-fries', 'Regular - Cheese', 0),
  ('food-french-fries', 'Regular - BBQ', 0),
  ('food-french-fries', 'Regular - Sour Cream', 0),
  ('food-french-fries', 'Large - Plain', 30),
  ('food-french-fries', 'Large - Cheese', 30),
  ('food-french-fries', 'Large - BBQ', 30),
  ('food-french-fries', 'Large - Sour Cream', 30);

-- Add Sandwich variations
INSERT INTO variations (menu_item_id, name, price) VALUES
  ('food-sandwiches', 'Clubhouse', 0),
  ('food-sandwiches', 'Ham & Cheese', 0);

-- Add Korean Ramen variations
INSERT INTO variations (menu_item_id, name, price) VALUES
  ('food-korean-ramen', 'Mild', 0),
  ('food-korean-ramen', 'Spicy', 0),
  ('food-korean-ramen', 'Mild with Cheese', 0),
  ('food-korean-ramen', 'Spicy with Cheese', 0);

-- Add Waffle Classic variations
INSERT INTO variations (menu_item_id, name, price) VALUES
  ('food-waffle-classic', 'Caramel Syrup', 0),
  ('food-waffle-classic', 'Choco Syrup', 0),
  ('food-waffle-classic', 'Maple Syrup', 0);

-- Add Burger variations
INSERT INTO variations (menu_item_id, name, price) VALUES
  ('food-burger', 'Regular', 0),
  ('food-burger', 'With Egg', 20);

-- === CARDINAL CAKES ===
INSERT INTO menu_items (id, name, description, base_price, category, popular, available, image_url) VALUES
  ('cake-custard', 'Custard Cake', 'Light and fluffy custard cake with smooth cream filling', 80, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('cake-yema', 'Yema Cake', 'Traditional Filipino yema cake with sweet condensed milk', 85, 'cardinal-cakes', true, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('cake-ube', 'Ube Cake', 'Purple yam cake with authentic ube flavor and cream', 90, 'cardinal-cakes', true, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('cake-red-velvet', 'Red Velvet Cake', 'Classic red velvet cake with cream cheese frosting', 100, 'cardinal-cakes', true, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('cake-chocolate', 'Moist Chocolate Cake', 'Rich and moist chocolate cake with chocolate ganache', 90, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('cake-strawberry', 'Strawberry Cake', 'Fresh strawberry shortcake with whipped cream', 110, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('cake-coffee', 'Coffee Caramel', 'Coffee-flavored cake with caramel drizzle', 95, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('cake-boston', 'Boston Pie Cake', 'Classic Boston cream pie with custard filling', 125, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('cake-mango', 'Mango Cream', 'Fresh mango cream cake with tropical flavors', 110, 'cardinal-cakes', false, true, 'https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Add Cake size variations
INSERT INTO variations (menu_item_id, name, price) VALUES
  ('cake-custard', 'Slice', 0),
  ('cake-custard', 'Whole', 510),
  ('cake-yema', 'Slice', 0),
  ('cake-yema', 'Whole', 605),
  ('cake-ube', 'Slice', 0),
  ('cake-ube', 'Whole', 600),
  ('cake-red-velvet', 'Slice', 0),
  ('cake-red-velvet', 'Whole', 690),
  ('cake-chocolate', 'Slice', 0),
  ('cake-chocolate', 'Whole', 600),
  ('cake-strawberry', 'Slice', 0),
  ('cake-strawberry', 'Whole', 730),
  ('cake-coffee', 'Slice', 0),
  ('cake-coffee', 'Whole', 645),
  ('cake-boston', 'Slice', 0),
  ('cake-boston', 'Whole', 865),
  ('cake-mango', 'Slice', 0),
  ('cake-mango', 'Whole', 730);

-- === COFFEE & LATTE DRINKS ===
-- Coffee (Hot/Iced)
INSERT INTO menu_items (id, name, description, base_price, category, popular, available, image_url) VALUES
  ('coffee-americano', 'Americano', 'Classic Americano coffee', 69, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('coffee-latte', 'Cafe Latte', 'Smooth espresso with steamed milk', 79, 'coffee-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('coffee-spanish', 'Spanish Latte', 'Rich Spanish-style latte', 79, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('coffee-vietnamese', 'Vietnamese Latte', 'Traditional Vietnamese coffee with condensed milk', 79, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('coffee-mocha', 'Mocha Latte', 'Rich chocolate mocha with espresso and cocoa', 89, 'coffee-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('coffee-caramel', 'Caramel Macchiato', 'Classic caramel macchiato with espresso and steamed milk', 89, 'coffee-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Latte (Hot/Iced)
INSERT INTO menu_items (id, name, description, base_price, category, popular, available, image_url) VALUES
  ('latte-chocolate', 'Chocolate Latte', 'Rich chocolate latte', 89, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('latte-matcha', 'Matcha Latte', 'Authentic Japanese matcha latte', 89, 'coffee-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('latte-red-velvet', 'Red Velvet Latte', 'Smooth red velvet latte', 89, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('latte-strawberry', 'Strawberry Milk Latte', 'Sweet strawberry milk latte', 89, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- ₱38 Coffee
INSERT INTO menu_items (id, name, description, base_price, category, popular, available, image_url) VALUES
  ('coffee-38-black', '₱38 Black Coffee', 'Budget-friendly black coffee', 38, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('coffee-38-latte', '₱38 Caffè Latte', 'Budget-friendly cafe latte', 38, 'coffee-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('coffee-38-caramel', '₱38 Caramel Macchiato', 'Budget-friendly caramel macchiato', 38, 'coffee-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('coffee-38-mocha', '₱38 Cafe Mocha', 'Budget-friendly mocha latte', 38, 'coffee-latte', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('coffee-38-matcha', '₱38 Cafe Matcha', 'Budget-friendly matcha latte', 38, 'coffee-latte', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Add Hot/Iced variations for coffee and latte drinks (excluding budget options)
INSERT INTO variations (menu_item_id, name, price) VALUES
  ('coffee-americano', 'Hot', 0),
  ('coffee-americano', 'Iced', 0),
  ('coffee-latte', 'Hot', 0),
  ('coffee-latte', 'Iced', 0),
  ('coffee-spanish', 'Hot', 0),
  ('coffee-spanish', 'Iced', 0),
  ('coffee-vietnamese', 'Hot', 0),
  ('coffee-vietnamese', 'Iced', 0),
  ('coffee-mocha', 'Hot', 0),
  ('coffee-mocha', 'Iced', 0),
  ('coffee-caramel', 'Hot', 0),
  ('coffee-caramel', 'Iced', 0),
  ('latte-chocolate', 'Hot', 0),
  ('latte-chocolate', 'Iced', 0),
  ('latte-matcha', 'Hot', 0),
  ('latte-matcha', 'Iced', 0),
  ('latte-red-velvet', 'Hot', 0),
  ('latte-red-velvet', 'Iced', 0),
  ('latte-strawberry', 'Hot', 0),
  ('latte-strawberry', 'Iced', 0);

-- === MILK TEA & SHAKES ===
-- Premium Milk Tea (₱79/₱89)
INSERT INTO menu_items (id, name, description, base_price, category, popular, available, image_url) VALUES
  ('milktea-hola', 'Hola Classic', 'Our signature milk tea with the perfect balance of tea and cream', 79, 'milktea-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('milktea-chocolate', 'Chocolate Milk Tea', 'Decadent chocolate milk tea for chocolate lovers', 79, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('milktea-oreo', 'Oreo Milk Tea', 'Creamy milk tea with crushed Oreo cookies', 79, 'milktea-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('milktea-nutella', 'Nutella Milk Tea', 'Rich and creamy Nutella milk tea', 79, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('milktea-red-velvet', 'Red Velvet Milk Tea', 'Smooth red velvet milk tea with a hint of cocoa', 79, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('milktea-cheesy-mango', 'Cheesy Mango Milk Tea', 'Sweet mango milk tea with cheesy foam', 79, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('milktea-wintermelon', 'Wintermelon Milk Tea', 'Refreshing wintermelon milk tea', 79, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('milktea-matcha', 'Matcha Milk Tea', 'Authentic Japanese matcha milk tea', 79, 'milktea-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Add Premium Milk Tea size variations
INSERT INTO variations (menu_item_id, name, price) VALUES
  ('milktea-hola', 'Regular', 0),
  ('milktea-hola', 'Large', 10),
  ('milktea-chocolate', 'Regular', 0),
  ('milktea-chocolate', 'Large', 10),
  ('milktea-oreo', 'Regular', 0),
  ('milktea-oreo', 'Large', 10),
  ('milktea-nutella', 'Regular', 0),
  ('milktea-nutella', 'Large', 10),
  ('milktea-red-velvet', 'Regular', 0),
  ('milktea-red-velvet', 'Large', 10),
  ('milktea-cheesy-mango', 'Regular', 0),
  ('milktea-cheesy-mango', 'Large', 10),
  ('milktea-wintermelon', 'Regular', 0),
  ('milktea-wintermelon', 'Large', 10),
  ('milktea-matcha', 'Regular', 0),
  ('milktea-matcha', 'Large', 10);

-- ₱38 Milktea
INSERT INTO menu_items (id, name, description, base_price, category, popular, available, image_url) VALUES
  ('milktea-38-chocolate', '₱38 Chocolate', 'Classic chocolate milk tea at an affordable price', 38, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('milktea-38-hazelnut', '₱38 Hazelnut', 'Rich hazelnut flavored milk tea', 38, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('milktea-38-cookies', '₱38 Cookies N Cream', 'Creamy cookies and cream milk tea', 38, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('milktea-38-red-velvet', '₱38 Red Velvet', 'Smooth red velvet milk tea', 38, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('milktea-38-taro', '₱38 Taro', 'Purple taro milk tea with authentic flavor', 38, 'milktea-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('milktea-38-cheesy-mango', '₱38 Cheesy Mango', 'Sweet mango milk tea with cheesy foam', 38, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('milktea-38-wintermelon', '₱38 Wintermelon', 'Refreshing wintermelon milk tea', 38, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('milktea-38-matcha', '₱38 Matcha', 'Authentic Japanese matcha milk tea', 38, 'milktea-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Frappe (₱109 each)
INSERT INTO menu_items (id, name, description, base_price, category, popular, available, image_url) VALUES
  ('frappe-choco', 'Choco Overload Frappe', 'Rich chocolate frappe topped with whipped cream and chocolate drizzle', 109, 'milktea-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('frappe-oreo', 'Oreo Cream Frappe', 'Creamy Oreo frappe with crushed cookies and whipped cream', 109, 'milktea-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('frappe-ube', 'Ube Overload Frappe', 'Purple yam frappe with authentic ube flavor and whipped cream', 109, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('frappe-avocado', 'Avocado Loco Frappe', 'Creamy avocado frappe with whipped cream topping', 109, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('frappe-nutella', 'Nutella Bomb Frappe', 'Explosive Nutella frappe with whipped cream and hazelnut drizzle', 109, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('frappe-mango', 'Mango Cream Frappe', 'Fresh mango frappe with creamy whipped topping', 109, 'milktea-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Cream Shake (₱79 each)
INSERT INTO menu_items (id, name, description, base_price, category, popular, available, image_url) VALUES
  ('shake-matcha-cream', 'Matcha Cream Shake', 'Creamy matcha shake', 79, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('shake-red-velvet-cream', 'Red Velvet Cream Shake', 'Smooth red velvet cream shake', 79, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('shake-strawberry-cream', 'Strawberry Cream Shake', 'Sweet strawberry cream shake', 79, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Choco Shake (₱50/₱60)
INSERT INTO menu_items (id, name, description, base_price, category, popular, available, image_url) VALUES
  ('shake-choco-kisses', 'Choco Kisses Shake', 'Chocolate shake with Hershey''s kisses', 50, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('shake-choco-mousse', 'Choco Mousse Shake', 'Rich chocolate mousse shake', 50, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('shake-double-dutch', 'Double Dutch Shake', 'Double chocolate Dutch shake', 50, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('shake-dark-choco', 'Dark Choco Shake', 'Intense dark chocolate shake', 50, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Add Choco Shake size variations
INSERT INTO variations (menu_item_id, name, price) VALUES
  ('shake-choco-kisses', 'Regular', 0),
  ('shake-choco-kisses', 'Large', 10),
  ('shake-choco-mousse', 'Regular', 0),
  ('shake-choco-mousse', 'Large', 10),
  ('shake-double-dutch', 'Regular', 0),
  ('shake-double-dutch', 'Large', 10),
  ('shake-dark-choco', 'Regular', 0),
  ('shake-dark-choco', 'Large', 10);

-- Fruit Shake (₱69/₱79)
INSERT INTO menu_items (id, name, description, base_price, category, popular, available, image_url) VALUES
  ('shake-mango', 'Mango Shake', 'Fresh mango fruit shake', 69, 'milktea-shakes', true, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('shake-mango-graham', 'Mango Graham Shake', 'Mango shake with graham crackers', 69, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('shake-banana', 'Banana Shake', 'Fresh banana fruit shake', 69, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800'),
  ('shake-banana-mango', 'Banana Mango Shake', 'Combined banana and mango shake', 69, 'milktea-shakes', false, true, 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=800');

-- Add Fruit Shake size variations
INSERT INTO variations (menu_item_id, name, price) VALUES
  ('shake-mango', 'Regular', 0),
  ('shake-mango', 'Large', 10),
  ('shake-mango-graham', 'Regular', 0),
  ('shake-mango-graham', 'Large', 10),
  ('shake-banana', 'Regular', 0),
  ('shake-banana', 'Large', 10),
  ('shake-banana-mango', 'Regular', 0),
  ('shake-banana-mango', 'Large', 10);

-- Insert default site settings
INSERT INTO site_settings (id, value, type, description) VALUES
  ('site_name', 'HOLA café', 'string', 'The name of the café'),
  ('site_description', 'Your neighborhood café serving fresh coffee, delicious pastries, and warm hospitality.', 'string', 'Site description'),
  ('currency', '₱', 'string', 'Currency symbol'),
  ('currency_code', 'PHP', 'string', 'Currency code');
