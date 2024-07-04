-- Add a new column to store the converted dates (optional but recommended)
ALTER TABLE ab_superstore_orders ADD COLUMN converted_order_date DATE;

-- Update the new column with the converted dates
UPDATE ab_superstore_orders
SET converted_order_date = CASE
    -- Convert dates in dd-mm-yyyy format
    WHEN order_date LIKE '%-%' THEN STR_TO_DATE(order_date, '%d-%m-%Y')
    -- Convert dates in mm/dd/yyyy format
    WHEN order_date LIKE '%/%' THEN STR_TO_DATE(order_date, '%m/%d/%Y')
END;

UPDATE ab_superstore_orders
SET order_date = DATE_FORMAT(converted_order_date, '%Y-%m-%d');

-- Optionally, drop the converted_order_date column if you no longer need it
ALTER TABLE ab_superstore_orders DROP COLUMN converted_order_date;