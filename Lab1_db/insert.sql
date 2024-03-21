---Insert Client's values
INSERT INTO client(id, surname, name, register_time, gender) VALUES (DEFAULT, 'Mikhailov', 'Dima', CURRENT_TIMESTAMP, 'MALE');
INSERT INTO client(id, surname, name, register_time, gender) VALUES (DEFAULT, 'Mikhailov', 'Diana', CURRENT_TIMESTAMP, 'FEMALE');
---

---Insert Branch type's values
INSERT INTO branch_type(id, name, register_time, mission) VALUES (DEFAULT, 'Накопительные счета и вклады.', CURRENT_TIMESTAMP, 'Накопительные счета и вклады.');
---

---Insert Branch's values
INSERT INTO branch(id, name, managers_quantity, proceeds, branch_type_id) VALUES (DEFAULT, 'НСВ', 1, 0, 1);
---

---Insert Manager's values
INSERT INTO manager(id, surname, name, gender, experience, free, branch_id) VALUES (DEFAULT, 'Букин', 'Геннадий', 'MALE', 1.24, false, 1);
INSERT INTO manager(id, surname, name, gender, experience, free, branch_id) VALUES (DEFAULT, 'Букин', 'Дмитрий', 'MALE', 1.24, true, 1);
---

---Insert Currency's values
INSERT INTO currency(id, name, value_to_dollar) VALUES (DEFAULT, 'Рубль', 1);
---

---Insert Account's values
INSERT INTO account(id, total, register_time, branch_id, client_id) VALUES (DEFAULT, 0, CURRENT_TIMESTAMP, 1, 1);
---

---Insert Transaction's values
INSERT INTO transaction(id, total, operation_type, currency_id, account_id) VALUES (DEFAULT, 12.0123, 'Cash deposit', 1, 1);
INSERT INTO transaction(id, total, operation_type, currency_id, account_id) VALUES (DEFAULT, 11, 'Cash deposit', 1, 1);
---