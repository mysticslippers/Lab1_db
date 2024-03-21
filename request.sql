---Additional task with select request
SELECT account.id, account.total, account.client_id, client.name
    FROM account INNER JOIN client ON account.client_id = client.id
        INNER JOIN branch ON (account.branch_id = branch.id) AND (branch.name = 'НСВ')