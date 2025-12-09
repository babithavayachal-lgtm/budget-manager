/*
  # Add currency support to profiles

  1. Changes
    - Add `currency` column to `profiles` table
      - Type: text
      - Default: 'USD'
      - Allows users to set their preferred currency for expense tracking
    
  2. Data Migration
    - Update existing profiles to use USD as default currency
*/

-- Add currency column to profiles table
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS currency text DEFAULT 'USD';

-- Update existing profiles to have USD as default
UPDATE profiles SET currency = 'USD' WHERE currency IS NULL;
