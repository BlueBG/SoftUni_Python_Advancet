CREATE OR REPLACE FUNCTION fn_courses_by_client(
    phone_num VARCHAR(20)
) RETURNS INT
AS
$$
DECLARE
    courses_count INT;
BEGIN
    SELECT COUNT(c.client_id)
    INTO
        courses_count
    FROM
        courses AS c
    JOIN
        clients AS cl
    ON
        c.client_id = cl.id
    WHERE cl.phone_number = phone_num;

    RETURN courses_count;
END;
$$
LANGUAGE plpgsql;


