---Create trigger function for additional task
CREATE FUNCTION update_account_total()
    RETURNS TRIGGER AS
    $$
    BEGIN
        IF NEW.operation_type = 'Cash deposit' THEN
            UPDATE account SET total = total + NEW.total WHERE id = NEW.account_id;
        ELSIF NEW.operation_type = 'Cash withdrawal' THEN
            UPDATE account SET total = total - NEW.total WHERE id = NEW.account_id;
        END IF;
        RETURN NEW;
    END;
    $$
LANGUAGE plpgsql;

CREATE FUNCTION update_branch_proceeds()
    RETURNS TRIGGER AS
    $$
    DECLARE
        total_sum NUMERIC;
    BEGIN
        SELECT SUM(account.total) INTO total_sum FROM account WHERE account.branch_id = NEW.branch_id;

        UPDATE branch SET proceeds = total_sum WHERE branch.id = NEW.branch_id;
        RETURN NEW;
    END;
    $$
LANGUAGE plpgsql;

CREATE FUNCTION update_managers_quantity()
    RETURNS TRIGGER AS
    $$
    BEGIN
        IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
            UPDATE branch SET managers_quantity = (
                SELECT COUNT(*) FROM manager WHERE (branch_id = NEW.branch_id) AND (free = FALSE)
            ) WHERE id = NEW.branch_id;
        end if;
    END;
    $$
LANGUAGE plpgsql;

---Create trigger for function
CREATE TRIGGER transaction_operation_trigger
    AFTER INSERT ON transaction
    FOR EACH ROW
    EXECUTE FUNCTION update_account_total();

CREATE TRIGGER branch_proceeds_trigger
    AFTER UPDATE OF total ON account
    FOR EACH ROW
    EXECUTE FUNCTION update_branch_proceeds();

CREATE TRIGGER branch_managers_quantity_trigger
    AFTER INSERT OR UPDATE ON manager
    FOR EACH ROW
    EXECUTE FUNCTION update_branch_proceeds();