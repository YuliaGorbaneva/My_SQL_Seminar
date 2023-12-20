use hw_seminar_6;

/*
Задача 1. 
Создайте процедуру, 
которая принимает кол-во сек и формат их в кол-во дней часов.
*/


DROP PROCEDURE transformation;
DELIMITER //
CREATE PROCEDURE transformation(sec INT)
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minu INT default 0;

    WHILE sec >= 84600 DO
    SET days = sec / 84600;
    SET sec = sec % 84600;
    END WHILE;

    WHILE sec >= 3600 DO
    SET hours = sec / 3600;
    SET sec = sec % 3600;
    END WHILE;

    WHILE sec >= 60 DO
    SET minu = sec / 60;
    SET sec = sec % 60;
    END WHILE;

SELECT days, hours, minu, sec;
END //
DELIMITER ;

CALL times(123456);

/*
Задача 2. 
Создайте функцию, 
которая выводит только четные числа от 1 до 10. 
*/
DROP FUNCTION numbers;
DELIMITER //
CREATE FUNCTION numbers (num INT)
RETURNS VARCHAR(50)
DETERMINISTIC 
BEGIN 
    DECLARE num1 INT DEFAULT 0; 
    DECLARE result VARCHAR(50) DEFAULT num;
    IF num % 2 != 0 THEN 
	SET num = num - 1;
        SET result = num;
        WHILE num > 0 DO
	    SET num1 = num - 2;
            SET num = num - 2;
	    SET result = concat(result, ' ', num1);
	END WHILE;
        RETURN result;
    ELSE
        WHILE num > 0 DO
	    SET num1 = num - 2;
            SET num = num - 2;
	    SET result = concat(result, ' ', num1);
	END WHILE;
        RETURN result;
END IF;
END //
DELIMITER ;

SELECT numbers(10);
