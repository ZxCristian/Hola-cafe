/*
  # HOLA Café Site Settings Update
  
  This migration updates the site settings to reflect the HOLA café branding.
*/

-- Update site settings for HOLA café
INSERT INTO site_settings (id, value, type, description) VALUES
  ('site_name', 'HOLA café', 'text', 'The name of the café'),
  ('site_description', 'Your neighborhood café serving fresh coffee, delicious pastries, and warm hospitality.', 'text', 'Description of the café'),
  ('currency', '₱', 'text', 'Currency symbol'),
  ('currency_code', 'PHP', 'text', 'Currency code')
ON CONFLICT (id) DO UPDATE SET
  value = EXCLUDED.value,
  type = EXCLUDED.type,
  description = EXCLUDED.description,
  updated_at = NOW();
