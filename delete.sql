DROP TABLE IF EXISTS account CASCADE;
DROP TABLE IF EXISTS branch CASCADE;
DROP TABLE IF EXISTS branch_type CASCADE;
DROP TABLE IF EXISTS client CASCADE;
DROP TABLE IF EXISTS currency CASCADE;
DROP TABLE IF EXISTS manager CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;
DROP TYPE IF EXISTS genders;
DROP TYPE IF EXISTS operations;
DROP FUNCTION IF EXISTS update_account_total() CASCADE;
DROP FUNCTION IF EXISTS update_branch_proceeds() CASCADE;
DROP FUNCTION IF EXISTS update_managers_quantity() CASCADE;
DROP TRIGGER IF EXISTS transaction_operation_trigger ON transaction CASCADE;
DROP TRIGGER IF EXISTS branch_proceeds_trigger ON branch CASCADE;
DROP TRIGGER IF EXISTS branch_managers_quantity_trigger ON branch CASCADE;