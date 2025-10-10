# HOLA Café Database Setup Guide

This guide will help you set up the HOLA café database with the complete menu and site settings.

## 🗄️ Database Migration File

### Complete Database Setup: `20250115000000_complete_database_setup.sql`

This file contains **everything you need** to set up your HOLA café database from scratch.

#### What's Included:

**Database Schema:**
- ✅ Categories table
- ✅ Menu items table
- ✅ Variations table
- ✅ Add-ons table
- ✅ Payment methods table
- ✅ Site settings table
- ✅ Row Level Security (RLS) policies
- ✅ Performance indexes

**Menu Data:**
- ✅ 5 categories: All-Day Breakfast, Food & Snacks, Cardinal Cakes, Coffee & Latte, Milktea & Shakes
- ✅ 80+ menu items with descriptions and pricing
- ✅ 100+ size/flavor variations
- ✅ Popular items marked
- ✅ High-quality café images

## 🚀 Setup Instructions

### Step 1: Access Supabase SQL Editor

1. Go to your Supabase project dashboard
2. Navigate to **SQL Editor** in the left sidebar
3. Click **New Query**

### Step 2: Run the Migration

Copy and paste the entire contents of `supabase/migrations/20250115000000_complete_database_setup.sql` into the SQL Editor and click **Run**.

**OR** if you're using Supabase CLI:

```bash
supabase migration up
```

### Step 3: Verify the Setup

After running the migration, verify that:

1. **Tables are created:**
   - categories (5 rows)
   - menu_items (80+ rows)
   - variations (100+ rows)
   - site_settings (4 rows)

2. **Check in Table Editor:**
   - Go to **Table Editor** in Supabase
   - Browse through each table
   - Verify data is populated correctly

3. **Test in your app:**
   - Make sure `.env.local` has your Supabase credentials:
     ```
     VITE_SUPABASE_URL=your_supabase_url
     VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
     ```
   - Run `npm run dev`
   - Check that menu items load correctly

## 📊 Menu Structure Overview

### 🍳 All-Day Breakfast (12 items) - ₱79-₱109
- **Basic (₱79):** Corned Beef, Longganisa, Ham
- **Mid (₱89-₱99):** Sisig, Tuna, Tocino, Spam
- **Premium (₱109):** Korean Beef, Pork Chop, Fried Chicken, Bangus, Bacon

### 🍔 Food & Snacks (10 items) - ₱40-₱199
- **Snacks:** Special Halo-Halo (₱70), French Fries (₱40 R | ₱70 L)
- **Sandwiches (₱85):** Clubhouse | Ham & Cheese
- **Pasta:** Carbonara (₱90)
- **Noodles:** Korean Ramen (₱99) - Mild or Spicy | With Cheese option
- **Waffles:** Classic (₱99), Banana Caramel (₱109), Waffle Trio (₱199)
- **Pizza:** 8" Pizza (₱150)
- **Burger B1T1:** ₱60 Regular | ₱80 With Egg

### 🍰 Cardinal Cakes (9 items) - Slice/Whole
- Custard: ₱80 | ₱590
- Yema: ₱85 | ₱690
- Ube: ₱90 | ₱690
- Red Velvet: ₱100 | ₱790
- Moist Chocolate: ₱90 | ₱690
- Strawberry: ₱110 | ₱840
- Coffee Caramel: ₱95 | ₱740
- Boston Pie: ₱125 | ₱990
- Mango Cream: ₱110 | ₱840

### ☕ Coffee & Latte (15 items) - ₱38-₱89

**Regular Coffee/Latte (Hot/Iced):**
- Americano (₱69)
- Cafe Latte, Spanish Latte, Vietnamese Latte (₱79)
- Mocha Latte, Caramel Macchiato (₱89)
- Chocolate, Matcha, Red Velvet, Strawberry Milk Latte (₱89)

**₱38 Coffee (Budget):**
- Black Coffee, Caffè Latte, Caramel Macchiato, Cafe Mocha, Cafe Matcha

### 🧋 Milktea & Shakes (34 items) - ₱38-₱109

**Premium Milktea (₱79 R | ₱89 L):**
- Hola Classic, Chocolate, Oreo, Nutella, Red Velvet, Cheesy Mango, Wintermelon, Matcha

**₱38 Milktea (Budget):**
- Chocolate, Hazelnut, Cookies N Cream, Red Velvet, Taro, Cheesy Mango, Wintermelon, Matcha

**Frappe (₱109):**
- Choco Overload, Oreo Cream, Ube Overload, Avocado Loco, Nutella Bomb, Mango Cream

**Cream Shake (₱79):**
- Matcha Cream, Red Velvet Cream, Strawberry Cream

**Choco Shake (₱50 R | ₱60 L):**
- Choco Kisses, Choco Mousse, Double Dutch, Dark Choco

**Fruit Shake (₱69 R | ₱79 L):**
- Mango, Mango Graham, Banana, Banana Mango

## 🎯 Key Features

### Size Variations
- **Coffee & Latte:** Hot/Iced variations for all drinks (except ₱38 options)
- **Milktea:** Regular/Large with ₱10 difference
- **Shakes:** Regular/Large with ₱10 difference
- **Cakes:** Slice/Whole with significant price differences
- **French Fries:** Regular/Large with ₱30 difference
- **French Fries Flavors:** Plain, Cheese, BBQ, Sour Cream

### Popular Items
- **Breakfast:** Longganisa, Sisig, Tocino, Fried Chicken, Bangus, Bacon
- **Food:** Special Halo-Halo, Carbonara, Korean Ramen, Burger B1T1
- **Cakes:** Yema, Ube, Red Velvet
- **Coffee:** Cafe Latte, Mocha Latte, Caramel Macchiato, Matcha Latte
- **Budget Coffee:** Caffè Latte, Caramel Macchiato, Cafe Mocha
- **Milktea:** Hola Classic, Oreo, Matcha (both premium and budget)
- **Frappe:** Choco Overload, Oreo Cream, Mango Cream
- **Shakes:** Mango Shake

### Special Features
- **B1T1 Burger:** Buy 1 Take 1 deal
- **Budget Options:** Extensive ₱38 menu sections
- **All-Day Breakfast:** 12 breakfast items available all day
- **Customization:** Multiple variations for drinks and food items
- **Variety:** 80+ menu items across 5 categories

## 🔧 Customization

### Adding New Menu Items

```sql
INSERT INTO menu_items (id, name, description, base_price, category, popular, available, image_url)
VALUES ('your-item-id', 'Item Name', 'Description', 99, 'category-id', false, true, 'image-url');
```

### Adding Variations

```sql
INSERT INTO variations (menu_item_id, name, price)
VALUES ('your-item-id', 'Regular', 0),
       ('your-item-id', 'Large', 10);
```

### Modifying Prices

```sql
UPDATE menu_items
SET base_price = 120
WHERE id = 'your-item-id';
```

### Marking Items as Popular

```sql
UPDATE menu_items
SET popular = true
WHERE id = 'your-item-id';
```

## 📱 Frontend Integration

The database structure is designed to work seamlessly with the existing React frontend:

- **Categories** are automatically loaded and displayed in the SubNav
- **Menu items** show with proper pricing and variations
- **Size selection** works through the variations system
- **Add-ons** are displayed as optional extras (if configured)
- **Popular items** are highlighted with badges in the UI
- **Images** are displayed from Pexels URLs

## 🎨 Images

All menu items use high-quality café images from Pexels:
- **Breakfast:** Breakfast plate images
- **Food:** Food and snack images
- **Drinks:** Coffee and drink images
- **Cakes:** Dessert and cake images
- **Consistent styling** across all categories

## 🔐 Security

The migration sets up proper security:
- **Row Level Security (RLS)** enabled on all tables
- **Public read access** for menu data (categories, menu_items, variations, add_ons)
- **Public read access** for active payment methods only
- **Admin write access** required for modifications (implement authentication separately)

## 📞 Troubleshooting

### Issue: Tables already exist
**Solution:** The migration drops existing tables. If you want to keep existing data, comment out the `DROP TABLE` statements.

### Issue: Foreign key errors
**Solution:** Make sure tables are created in the correct order (the migration handles this).

### Issue: UUID extension error
**Solution:** The migration enables the UUID extension automatically.

### Issue: Data not showing in app
**Solution:** 
1. Check your `.env.local` file has correct Supabase credentials
2. Verify RLS policies are created
3. Check browser console for errors
4. Verify data exists in Supabase Table Editor

## 🎉 You're Ready!

After running the migration, your HOLA café database is fully set up with:
- ✅ Complete database schema
- ✅ 80+ menu items
- ✅ 100+ variations
- ✅ Security policies
- ✅ Site settings
- ✅ Optimized indexes

Start your app with `npm run dev` and enjoy your fully functional HOLA café ordering system!

---

**Need help?** Check the React components in `src/components/` to see how the database is queried and displayed.

**Admin Dashboard:** Access at `/admin` with password: `HOLACafe@Admin!2025`
