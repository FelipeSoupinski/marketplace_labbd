DELIMITER $

CREATE TRIGGER logs_update_categorias AFTER UPDATE
ON categorias
FOR EACH ROW
BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"descricao":"', OLD.descricao, '"}'));
	SET @new_data = (CONCAT('{"id":', NEW.id, ',"nome":"', NEW.nome, '",', '"descricao":"', NEW.descricao, '"}'));

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'categorias'
    	AND id_item_modif = OLD.id AND action = 'update' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'categorias', @old_data, @new_data, now());
END$

CREATE TRIGGER logs_delete_categorias AFTER DELETE
ON categorias
FOR EACH ROW
BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"descricao":"', OLD.descricao, '"}'));
	SET @new_data = NULL;

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'categorias'
    	AND id_item_modif = OLD.id AND action = 'delete' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'categorias', @old_data, @new_data, now());
END$

DELIMITER ;


DELIMITER $

CREATE TRIGGER logs_update_produtos AFTER UPDATE
ON produtos
FOR EACH ROW
BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"descricao":"', OLD.descricao, '",', '"imagem":"', OLD.imagem, '",', '"preco":', OLD.preco, ',', '"loja_id":', OLD.loja_id, '}'));
	SET @new_data = (CONCAT('{"id":', NEW.id, ',"nome":"', NEW.nome, '",', '"descricao":"', NEW.descricao, '",', '"imagem":"', NEW.imagem, '",', '"preco":', NEW.preco, ',', '"loja_id":', NEW.loja_id, '}'));

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'produtos'
    	AND id_item_modif = OLD.id AND action = 'update' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'produtos', @old_data, @new_data, now());
END$

CREATE TRIGGER logs_delete_produtos AFTER DELETE
ON produtos
FOR EACH ROW
BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"descricao":"', OLD.descricao, '",', '"imagem":"', OLD.imagem, '",', '"preco":', OLD.preco, ',', '"loja_id":', OLD.loja_id, '}'));
	SET @new_data = NULL;

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'produtos'
    	AND id_item_modif = OLD.id AND action = 'delete' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'produtos', @old_data, @new_data, now());
END$

DELIMITER ;


DELIMITER $

CREATE TRIGGER logs_update_usuarios AFTER UPDATE
ON usuarios
FOR EACH ROW
BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"email":"', OLD.email, '"}'));
	SET @new_data = (CONCAT('{"id":', NEW.id, ',"nome":"', NEW.nome, '",', '"email":"', NEW.email, '"}'));

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'usuarios'
    	AND id_item_modif = OLD.id AND action = 'update' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'usuarios', @old_data, @new_data, now());
END$

CREATE TRIGGER logs_delete_usuarios AFTER DELETE
ON usuarios
FOR EACH ROW
BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"email":"', OLD.email, '"}'));
	SET @new_data = NULL;

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'usuarios'
    	AND id_item_modif = OLD.id AND action = 'delete' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'usuarios', @old_data, @new_data, now());
END$

DELIMITER ;


DELIMITER $

CREATE TRIGGER logs_update_lojas AFTER UPDATE
ON lojas
FOR EACH ROW
BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"descricao":"', OLD.descricao, '",', '"usuario_id":', OLD.usuario_id, '}'));
	SET @new_data = (CONCAT('{"id":', NEW.id, ',"nome":"', NEW.nome, '",', '"descricao":"', NEW.descricao, '",', '"usuario_id":', NEW.usuario_id, '}'));

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'lojas'
    	AND id_item_modif = OLD.id AND action = 'update' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'lojas', @old_data, @new_data, now());
END$

CREATE TRIGGER logs_delete_lojas AFTER DELETE
ON lojas
FOR EACH ROW
BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"descricao":"', OLD.descricao, '",', '"usuario_id":', OLD.usuario_id, '}'));
	SET @new_data = NULL;

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'lojas'
    	AND id_item_modif = OLD.id AND action = 'delete' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'lojas', @old_data, @new_data, now());
END$

DELIMITER ;


DELIMITER $

CREATE TRIGGER logs_update_pagamentos AFTER UPDATE
ON pagamentos
FOR EACH ROW
BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"valor":', OLD.valor, ',', '"forma":"', OLD.forma, '",', '"loja_id":', OLD.loja_id, '}'));
	SET @new_data = (CONCAT('{"id":', NEW.id, ',"valor":', NEW.valor, ',', '"forma":"', NEW.forma, '",', '"loja_id":', NEW.loja_id, '}'));

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'pagamentos'
    	AND id_item_modif = OLD.id AND action = 'update' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'pagamentos', @old_data, @new_data, now());
END$

CREATE TRIGGER logs_delete_pagamentos AFTER DELETE
ON pagamentos
FOR EACH ROW
BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"valor":', OLD.valor, ',', '"forma":"', OLD.forma, '",', '"loja_id":', OLD.loja_id, '}'));
	SET @new_data = NULL;

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'pagamentos'
    	AND id_item_modif = OLD.id AND action = 'delete' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'pagamentos', @old_data, @new_data, now());
END$

DELIMITER ;